type UserType = 'staff' | 'client' | 'agent';

interface VerificationEmailTypes {
    token: string;
    name: string;
    userId: string;
    type: UserType;
}

interface PasswordResetEmailTypes {
    resetToken: string;
    name: string;
    userId: string;
    type: UserType;
}

interface PasswordChangedEmailTypes {
    name: string;
}

interface EmailAlarmReminder {
    userName: string;
    alarmName: string;
    attachment?: {
        filename: string;
        content: Uint8Array;
    }[];
}

type Media = {
    fieldname: string;
    originalname: string;
    encoding: string;
    mimetype: string;
    buffer: Buffer;
    size: number;
};

interface StaffJWTPayLoad {
    id: string;
    email: string;
    englishName: string;
    chineseName: string;
    departmentId: string;
}
interface ClientJWTPayload {
    id: string;
    contactPerson: string;
}
interface ClientJWTPayload {
    id: string;
    contactPerson: string;
}
interface AgentJWTPayload {
    id: string;
    contactPerson: string;
}
interface PaginationQuery {
    page: number;
    row: number;
    sortField: string | null;
    sortOrder: 'asc' | 'desc' | null;
}
