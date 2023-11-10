import { Department, Prisma } from '@prisma/client';
import prisma, { createSelect } from '../../../utils/prisma';
import { permissions } from '../../../data/department';

export interface DepartmentPaginationQuery extends PaginationQuery {
    name: string;
}
export const getDepartmentListByPagination = async (query: DepartmentPaginationQuery) => {
    const { page, row, name, sortField, sortOrder } = query;

    const departmentWhereOptions: Prisma.DepartmentWhereInput = {
        deletedAt: null,
        name: name ?? undefined,
    };

    const departmentColumns: (keyof Department)[] = ['id', 'name', 'superAdmin', 'createdAt', 'updatedAt'];

    const department = await prisma.$transaction([
        prisma.department.count({
            where: departmentWhereOptions,
        }),
        prisma.department.findMany({
            where: departmentWhereOptions,
            select: createSelect(departmentColumns),
            take: row,
            skip: (page - 1) * row,
            orderBy: {
                [!sortField ? 'createdAt' : sortField]: sortOrder ?? 'asc',
            },
        }),
    ]);

    return {
        count: department[0],
        rows: department[1],
    };
};

export const getDepartment = async (departmentId: string) => {
    const department = await prisma.department.findFirst({
        where: {
            id: departmentId,
            deletedAt: null,
        },
    });

    if (!department) {
        throw {
            status: 404,
            message: 'APIMessage:departmentNotFound',
        };
    }

    return department;
};

export const createDepartment = async (values: Department) => {
    const departmentResponse = await prisma.department.create({
        data: {
            ...values,
            superAdmin: false,
        },
        select: {
            id: true,
        },
    });

    return departmentResponse;
};

export const updateDepartment = async (departmentId: string, values: Department) => {
    const department = await prisma.department.findFirst({
        where: {
            id: departmentId,
            deletedAt: null,
        },
    });

    if (!department) {
        throw {
            status: 404,
            message: 'APIMessage:Department not found',
        };
    }

    if (department.name !== values.name) {
        await prisma.department.update({
            where: {
                id: departmentId,
            },
            data: {
                name: values.name,
            },
        });

        return department;
    }

    if (department.superAdmin) {
        throw {
            status: 400,
            message: 'APIMessage:departmentNotEditable',
        };
    }

    await prisma.department.update({
        where: {
            id: departmentId,
        },
        data: values,
    });

    return department;
};

export const deleteDepartment = async (departmentId: string) => {
    const isUserAttachedToThisDepartment = await prisma.staff.count({
        where: {
            departmentId,
            deletedAt: null,
        },
    });

    if (isUserAttachedToThisDepartment > 0) {
        throw {
            status: 400,
            message: 'APIMessage:departmentInUse',
        };
    }

    const department = await prisma.department.findFirst({
        where: {
            id: departmentId,
            deletedAt: null,
        },
    });

    if (!department) {
        throw {
            status: 404,
            message: 'APIMessage:departmentNotFound',
        };
    }

    if (department.superAdmin) {
        throw {
            status: 400,
            message: 'APIMessage:departmentNotDeletable',
        };
    }

    await prisma.department.update({
        where: {
            id: departmentId,
        },
        data: {
            deletedAt: new Date(),
        },
    });

    return department;
};

export const restoreDepartment = async (departmentId: string) => {
    const department = await prisma.department.findFirst({
        where: {
            id: departmentId,
        },
    });

    if (!department) {
        throw {
            status: 404,
            message: 'APIMessage:Department not found',
        };
    }

    await prisma.department.update({
        where: {
            id: departmentId,
        },
        data: {
            deletedAt: null,
        },
    });

    return department;
};

export const duplicateDepartment = async (values: Department, departmentId: string) => {
    const departmentFrom = await prisma.department.findFirst({
        where: {
            deletedAt: null,
            id: departmentId,
        },
        select: {
            ...createSelect(permissions as unknown as string[]),
        },
    });

    const departmentResponse = await prisma.department.create({
        data: {
            ...departmentFrom,
            name: values.name,
            superAdmin: false,
        },
    });

    return departmentResponse;
};
