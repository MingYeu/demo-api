import { Prisma, PrismaClient } from '@prisma/client';
import { roleInObject } from '../data/department';
import bcrypt from 'bcryptjs';

const prisma = new PrismaClient({
    datasources: {
        db: {
            url: process.env.NODE_ENV === 'production' ? process.env.DATABASE_URL : process.env.DEV_DATABASE_URL,
        },
    },
});

export const prismaInitialization = async () => {
    console.log('Initializing Default Data...'.yellow);
    const department = await findOrCreateDefaultDepartment();
    await findOrCreateDefaultAccount(department.id);
    console.log('Default Data Initialize'.green);
};

const findOrCreateDefaultDepartment = async () => {
    const department = await prisma.department.findFirst({
        where: {
            superAdmin: true,
        },
        select: {
            id: true,
        },
    });

    if (!department) {
        return await prisma.department.create({
            data: {
                name: 'Super Admin',
                superAdmin: true,
                ...roleInObject(),
            },
            select: {
                id: true,
            },
        });
    }

    return department;
};

const findOrCreateDefaultAccount = async (departmentId: string) => {
    const existingStaff = await prisma.staff.findFirst({
        select: {
            id: true,
        },
        where: {
            email: process.env.DEFAULT_EMAIL as string,
            deletedAt: null,
        },
    });

    if (!existingStaff) {
        const salt = bcrypt.genSaltSync(10);
        const hashedPassword = bcrypt.hashSync(process.env.DEFAULT_PASSWORD as string, salt);

        return await prisma.staff.create({
            data: {
                chineseName: '超级管理员',
                englishName: 'Super Admin',
                username: process.env.DEFAULT_USERNAME as string,
                nickname: 'Super Admin',
                dateOfBirth: new Date(),
                nationality: 'Malaysia',
                documentNumber: '-',
                dateOfJoin: new Date(),
                position: 'System Admin',
                mobile1: '60123456789',
                address: '-',
                email: process.env.DEFAULT_EMAIL as string,
                password: hashedPassword,
                departmentId,
                lastActive: new Date(),
            },
            select: {
                id: true,
            },
        });
    }

    return existingStaff;
};

export const createSelect = <T extends string>(attributes: T[]): Record<T, true> => {
    const select = {} as Record<T, true>;

    for (const attribute of attributes) {
        select[attribute] = true;
    }

    return select;
};

type A<T extends string> = T extends `${infer U}ScalarFieldEnum` ? U : never;
type Entity = A<keyof typeof Prisma>;
type Keys<T extends Entity> = Extract<keyof (typeof Prisma)[keyof Pick<typeof Prisma, `${T}ScalarFieldEnum`>], string>;

export function prismaExclude<T extends Entity, K extends Keys<T>>(type: T, omit: K[]) {
    type Key = Exclude<Keys<T>, K>;
    type TMap = Record<Key, true>;
    const result: TMap = {} as TMap;
    for (const key in Prisma[`${type}ScalarFieldEnum`]) {
        if (!omit.includes(key as K)) {
            result[key as Key] = true;
        }
    }
    return result;
}

export default prisma;
