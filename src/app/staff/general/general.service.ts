import prisma, { createSelect } from '../../../utils/prisma';
import { Prisma } from '@prisma/client';

interface TableObject {
    tableName: string;
    id: string;
}

export interface ActivityLogger {
    targetId: TableObject;
    executorName: string | 'SYSTEM';
    staffId?: string;
    rtId?: string;
    action: string;
    description: string;
    reason?: string;
    data?: { [key: string]: any };
}
