import { Prisma } from '@prisma/client';
import prisma, { createSelect } from '../../../utils/prisma';

export interface CasePaginationQuery extends PaginationQuery {
    name: string;
    caseId: string;
    workId: string;
    clientId: string;
    personInCharge: string;
}

export const getCaseList = async (query: CasePaginationQuery, staffId: string | undefined) => {
    const { page, row, sortField, sortOrder } = query;

    let caseWhereOptions: Prisma.CaseWhereInput = {
        deletedAt: null,
    };

    const caseData = await prisma.$transaction([
        prisma.case.count({
            where: caseWhereOptions,
        }),
        prisma.case.findMany({
            where: caseWhereOptions,
            select: {
                ...createSelect(['name', 'description', 'caseId']),
            },
            take: row,
            skip: (page - 1) * row,
            orderBy: {
                [!sortField ? 'createdAt' : sortField]: sortOrder ?? 'asc',
            },
        }),
    ]);

    return {
        count: caseData[0],
        rows: caseData[1],
    };
};

interface CreateCaseData {
    name: string;
    description: string;
}

export const createCase = async (caseData: CreateCaseData) => {
    const { name, description } = caseData;

    const createdCase = await prisma.case.create({
        data: {
            name,
            description,
        },
        select: { id: true },
    });

    return createdCase;
};
