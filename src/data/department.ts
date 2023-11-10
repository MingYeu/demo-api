import { Department } from '@prisma/client';

type DepartmentColumn = (keyof Department)[];

export const permissions = [
    'STAFF_VIEW',
    'STAFF_CREATE',
    'STAFF_UPDATE',
    'STAFF_DELETE',
    'DEPARTMENT_VIEW',
    'DEPARTMENT_CREATE',
    'DEPARTMENT_UPDATE',
    'DEPARTMENT_DELETE',
    'CLIENT_MASTER_LISTING',
    'CLIENT_CREATE',
    'CLIENT_UPDATE',
    'CLIENT_DELETE',
    'CLIENT_CREDENTIAL',
    'AGENT_MASTER_LISTING',
    'AGENT_CREATE',
    'AGENT_UPDATE',
    'AGENT_DELETE',
    'MARKETING_VIEW',
    'MARKETING_CREATE',
    'MARKETING_UPDATE',
    'MARKETING_DELETE',
    'CASE_MASTER_LISTING',
    'CASE_CREATE',
    'CASE_UPDATE',
    'CASE_DELETE',
    'JOB_VIEW',
    'JOB_CREATE',
    'JOB_UPDATE',
    'JOB_DELETE',
    'JOB_AMOUNT',
    'TASK_VIEW',
    'TASK_CREATE',
    'TASK_UPDATE',
    'TASK_DELETE',
    'ACTIVITY_VIEW',
    'ACTIVITY_CREATE',
    'ACTIVITY_UPDATE',
    'ACTIVITY_DELETE',
    'CONTRACT_VIEW',
    'CONTRACT_CREATE',
    'CONTRACT_UPDATE',
    'CONTRACT_DELETE',
    'COSTING_VIEW',
    'COSTING_CREATE',
    'COSTING_UPDATE',
    'COSTING_DELETE',
    'INCENTIVE_VIEW',
    'INCENTIVE_CREATE',
    'INCENTIVE_UPDATE',
    'INCENTIVE_DELETE',
    'PAYMENT_VIEW',
    'PAYMENT_CREATE',
    'PAYMENT_UPDATE',
    'PAYMENT_DELETE',
    'ALARM_MASTER_LISTING',
    'ALARM_CREATE',
    'ALARM_UPDATE',
    'ALARM_DELETE',
    'CASE_ALARM_VIEW',
    'CASE_ALARM_CREATE',
    'CASE_ALARM_UPDATE',
    'CASE_ALARM_DELETE',
    'DOCUMENT_VIEW',
    'DOCUMENT_CREATE',
    'DOCUMENT_UPDATE',
    'DOCUMENT_DELETE',
    'PERSON_INVOLVE_VIEW',
    'PERSON_INVOLVE_CREATE',
    'PERSON_INVOLVE_DELETE',
    'QUOTATION_MASTER_LISTING',
    'QUOTATION_CREATE',
    'QUOTATION_UPDATE',
    'QUOTATION_DELETE',
    'CASE_STATUS_OPEN',
    'CASE_STATUS_CLOSE',
    'CASE_STATUS_COMPLETE',
    'TEMPLATE_VIEW',
    'TEMPLATE_CREATE',
    'TEMPLATE_UPDATE',
    'TEMPLATE_DELETE',
    'WORK',
    'JURISDICTION',
    'JOB',
    'CLASS',
    'TASK_STATUS',
    'ACTIVITY_LOG',
    'MEDIA',
    'SITE_SETTING',
    'EFORM',
    'REPORT',
] as const;

export const roleInObject = () => {
    // Assign role to object with true value
    const roleObject: any = {};
    permissions.forEach((role) => {
        roleObject[role] = true;
    });
    return roleObject;
};

const departmentColumn: DepartmentColumn = ['id', 'name', 'superAdmin', ...permissions, 'createdAt', 'updatedAt', 'deletedAt'];

const departmentData = {
    exclude: (excludedColumns: DepartmentColumn) => {
        return departmentColumn.filter((column) => !excludedColumns.includes(column));
    },
    getAll: departmentColumn,
};

export default departmentData;
