-- CreateEnum
CREATE TYPE "UserType" AS ENUM ('staff', 'agent', 'client');

-- CreateEnum
CREATE TYPE "MarketingStatus" AS ENUM ('draft', 'active', 'inactive');

-- CreateEnum
CREATE TYPE "MarketingGroupStatus" AS ENUM ('inProgress', 'completed');

-- CreateEnum
CREATE TYPE "MarketingReceiverStatus" AS ENUM ('failed', 'sent');

-- CreateEnum
CREATE TYPE "CasePersonInChargeType" AS ENUM ('consultant', 'associate');

-- CreateEnum
CREATE TYPE "DynamicInputFieldType" AS ENUM ('text', 'media');

-- CreateEnum
CREATE TYPE "PaymentStatus" AS ENUM ('Paid', 'PartiallyPaid', 'Unpaid');

-- CreateEnum
CREATE TYPE "DiscountUnit" AS ENUM ('Cash', 'Percentage');

-- CreateEnum
CREATE TYPE "AlarmStatus" AS ENUM ('upcoming', 'completed');

-- CreateEnum
CREATE TYPE "ReminderType" AS ENUM ('minutes', 'hours', 'days', 'months');

-- CreateTable
CREATE TABLE "Department" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "superAdmin" BOOLEAN NOT NULL DEFAULT false,
    "STAFF_VIEW" BOOLEAN NOT NULL DEFAULT false,
    "STAFF_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "STAFF_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "STAFF_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "DEPARTMENT_VIEW" BOOLEAN NOT NULL DEFAULT false,
    "DEPARTMENT_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "DEPARTMENT_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "DEPARTMENT_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "CLIENT_MASTER_LISTING" BOOLEAN NOT NULL DEFAULT false,
    "CLIENT_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "CLIENT_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "CLIENT_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "CLIENT_CREDENTIAL" BOOLEAN NOT NULL DEFAULT false,
    "AGENT_MASTER_LISTING" BOOLEAN NOT NULL DEFAULT false,
    "AGENT_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "AGENT_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "AGENT_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "MARKETING_VIEW" BOOLEAN NOT NULL DEFAULT false,
    "MARKETING_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "MARKETING_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "MARKETING_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "CASE_MASTER_LISTING" BOOLEAN NOT NULL DEFAULT false,
    "CASE_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "CASE_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "CASE_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "JOB_VIEW" BOOLEAN NOT NULL DEFAULT false,
    "JOB_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "JOB_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "JOB_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "JOB_AMOUNT" BOOLEAN NOT NULL DEFAULT false,
    "TASK_VIEW" BOOLEAN NOT NULL DEFAULT false,
    "TASK_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "TASK_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "TASK_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "ACTIVITY_VIEW" BOOLEAN NOT NULL DEFAULT false,
    "ACTIVITY_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "ACTIVITY_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "ACTIVITY_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "CONTRACT_VIEW" BOOLEAN NOT NULL DEFAULT false,
    "CONTRACT_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "CONTRACT_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "CONTRACT_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "COSTING_VIEW" BOOLEAN NOT NULL DEFAULT false,
    "COSTING_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "COSTING_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "COSTING_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "PAYMENT_VIEW" BOOLEAN NOT NULL DEFAULT false,
    "PAYMENT_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "PAYMENT_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "PAYMENT_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "ALARM_VIEW" BOOLEAN NOT NULL DEFAULT false,
    "ALARM_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "ALARM_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "ALARM_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "DOCUMENT_VIEW" BOOLEAN NOT NULL DEFAULT false,
    "DOCUMENT_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "DOCUMENT_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "DOCUMENT_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "PERSON_INVOLVE_VIEW" BOOLEAN NOT NULL DEFAULT false,
    "PERSON_INVOLVE_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "PERSON_INVOLVE_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "QUOTATION_MASTER_LISTING" BOOLEAN NOT NULL DEFAULT false,
    "QUOTATION_CREATE" BOOLEAN NOT NULL DEFAULT false,
    "QUOTATION_UPDATE" BOOLEAN NOT NULL DEFAULT false,
    "QUOTATION_DELETE" BOOLEAN NOT NULL DEFAULT false,
    "WORK" BOOLEAN NOT NULL DEFAULT false,
    "JURISDICTION" BOOLEAN NOT NULL DEFAULT false,
    "JOB" BOOLEAN NOT NULL DEFAULT false,
    "CLASS" BOOLEAN NOT NULL DEFAULT false,
    "TASK_STATUS" BOOLEAN NOT NULL DEFAULT false,
    "EFORM" BOOLEAN NOT NULL DEFAULT false,
    "ACTIVITY_LOG" BOOLEAN NOT NULL DEFAULT false,
    "MEDIA" BOOLEAN NOT NULL DEFAULT false,
    "SITE_SETTING" BOOLEAN NOT NULL DEFAULT false,
    "REPORT" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Staff" (
    "id" TEXT NOT NULL,
    "staffId" SERIAL NOT NULL,
    "chineseName" VARCHAR(255),
    "englishName" VARCHAR(255) NOT NULL,
    "nickname" VARCHAR(255) NOT NULL,
    "dateOfBirth" TIMESTAMPTZ(6) NOT NULL,
    "nationality" VARCHAR(255) NOT NULL,
    "documentNumber" VARCHAR(255) NOT NULL,
    "dateOfJoin" TIMESTAMPTZ(6) NOT NULL,
    "position" VARCHAR(255) NOT NULL,
    "directLine" VARCHAR(255),
    "mobile1" VARCHAR(255) NOT NULL,
    "mobile2" VARCHAR(255),
    "email" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "remarks" VARCHAR(255),
    "username" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255),
    "lastActive" TIMESTAMPTZ(6) NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "token" VARCHAR(255),
    "tokenExpiredAt" TIMESTAMPTZ(6),
    "resetToken" VARCHAR(255),
    "resetTokenExpiredAt" TIMESTAMPTZ(6),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),
    "departmentId" TEXT NOT NULL,

    CONSTRAINT "Staff_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Client" (
    "id" TEXT NOT NULL,
    "clientId" SERIAL NOT NULL,
    "companyName" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255),
    "website" VARCHAR(255),
    "industry" VARCHAR(255),
    "contactPerson" VARCHAR(255),
    "title" VARCHAR(255),
    "mobile" VARCHAR(255),
    "directLine" VARCHAR(255),
    "phone" VARCHAR(255),
    "email" VARCHAR(255),
    "referredBy" VARCHAR(255),
    "remarks" TEXT,
    "username" VARCHAR(255),
    "password" VARCHAR(255),
    "lastActive" TIMESTAMPTZ(6),
    "portalExpiryDate" TIMESTAMPTZ(6),
    "token" VARCHAR(255),
    "tokenExpiredAt" TIMESTAMPTZ(6),
    "resetToken" VARCHAR(255),
    "resetTokenExpiredAt" TIMESTAMPTZ(6),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClientPersonInCharge" (
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "clientId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,

    CONSTRAINT "ClientPersonInCharge_pkey" PRIMARY KEY ("clientId","staffId")
);

-- CreateTable
CREATE TABLE "Agent" (
    "id" TEXT NOT NULL,
    "agentId" SERIAL NOT NULL,
    "companyName" VARCHAR(255),
    "address" VARCHAR(255),
    "website" VARCHAR(255),
    "industry" VARCHAR(255),
    "contactPerson" VARCHAR(255) NOT NULL,
    "title" VARCHAR(255),
    "mobile" VARCHAR(255),
    "directLine" VARCHAR(255),
    "phone" VARCHAR(255),
    "email" VARCHAR(255) NOT NULL,
    "referredBy" VARCHAR(255),
    "remarks" TEXT,
    "username" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255),
    "lastActive" TIMESTAMPTZ(6) NOT NULL,
    "portalExpiryDate" TIMESTAMPTZ(6),
    "token" VARCHAR(255),
    "tokenExpiredAt" TIMESTAMPTZ(6),
    "resetToken" VARCHAR(255),
    "resetTokenExpiredAt" TIMESTAMPTZ(6),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Agent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AgentPersonInCharge" (
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "agentId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,

    CONSTRAINT "AgentPersonInCharge_pkey" PRIMARY KEY ("agentId","staffId")
);

-- CreateTable
CREATE TABLE "ActivityLog" (
    "id" TEXT NOT NULL,
    "targetId" VARCHAR(255) NOT NULL,
    "executorName" VARCHAR(255) NOT NULL,
    "action" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "reason" VARCHAR(255) DEFAULT '',
    "data" JSON,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "staffId" TEXT,
    "clientId" TEXT,
    "agentId" TEXT,

    CONSTRAINT "ActivityLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Media" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "size" INTEGER NOT NULL,
    "key" TEXT NOT NULL,
    "isPublic" BOOLEAN NOT NULL DEFAULT false,
    "reference_table" VARCHAR(255),
    "reference_id" VARCHAR(255),
    "permission" TEXT,
    "userType" "UserType" NOT NULL,
    "uploadedBy" TEXT,
    "userId" VARCHAR(255),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Media_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Marketing" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "subject" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "status" "MarketingStatus" NOT NULL DEFAULT 'draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Marketing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Attachment" (
    "id" TEXT NOT NULL,
    "marketingId" TEXT NOT NULL,
    "mediaId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Attachment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MarketingGroup" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "status" "MarketingGroupStatus" NOT NULL,
    "success" INTEGER NOT NULL,
    "failed" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),
    "marketingId" TEXT,

    CONSTRAINT "MarketingGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MarketingReceiver" (
    "email" TEXT NOT NULL,
    "status" "MarketingReceiverStatus" NOT NULL,
    "groupId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "MarketingReceiver_pkey" PRIMARY KEY ("email","groupId")
);

-- CreateTable
CREATE TABLE "Work" (
    "id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "fields" JSONB[] DEFAULT ARRAY[]::JSONB[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Work_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Jurisdiction" (
    "id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Jurisdiction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Job" (
    "id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Job_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Class" (
    "id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Class_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EForm" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "mediaId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "EForm_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Case" (
    "id" TEXT NOT NULL,
    "caseId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "process" TEXT NOT NULL DEFAULT 'Initialize',
    "status" TEXT,
    "remarks" TEXT,
    "clientId" TEXT NOT NULL,
    "applicationSubmittedDate" TIMESTAMP(3),
    "projectStartDate" TIMESTAMP(3),
    "projectEndDate" TIMESTAMP(3),
    "projectPeriod" TEXT,
    "fundingProjectAmount" DOUBLE PRECISION,
    "approvedProjectAmount" DOUBLE PRECISION,
    "projectDetails" TEXT,
    "projectContactPerson" TEXT,
    "projectContactNumber" TEXT,
    "projectContactEmail" TEXT,
    "emailLoginLink" TEXT,
    "emailLoginUsername" TEXT,
    "emailLoginPassword" TEXT,
    "fundingSchemeLoginLink" TEXT,
    "fundingSchemeLoginUsername" TEXT,
    "fundingSchemeLoginPassword" TEXT,
    "secretariatContactName" TEXT,
    "secretariatContactNumber" TEXT,
    "secretariatContactEmail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),
    "workId" TEXT NOT NULL,

    CONSTRAINT "Case_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Case_PersonInCharge" (
    "caseId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "type" "CasePersonInChargeType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Case_PersonInCharge_pkey" PRIMARY KEY ("caseId","staffId")
);

-- CreateTable
CREATE TABLE "Case_AgentInCharge" (
    "caseId" TEXT NOT NULL,
    "agentId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Case_AgentInCharge_pkey" PRIMARY KEY ("caseId","agentId")
);

-- CreateTable
CREATE TABLE "Case_DynamicInputField" (
    "id" TEXT NOT NULL,
    "fieldName" TEXT NOT NULL,
    "type" "DynamicInputFieldType" NOT NULL,
    "mediaId" TEXT NOT NULL,
    "caseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Case_DynamicInputField_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Case_Job" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "jurisdictionId" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    "classId" TEXT NOT NULL,
    "jobId" TEXT NOT NULL,
    "caseId" TEXT NOT NULL,
    "applicationNumber" TEXT,
    "filingDate" TIMESTAMP(3),
    "publicationDate" TIMESTAMP(3),
    "legalStatus" TEXT,
    "currentOAStatus" TEXT,
    "oaIssueDate" TIMESTAMP(3),
    "clientApproachDate" TIMESTAMP(3),
    "maintenanceRenewal" TIMESTAMP(3),
    "nextRenewalDate" TIMESTAMP(3),
    "type" TEXT,
    "title" TEXT,
    "applicant" TEXT,
    "inventor" TEXT,
    "publicationNumber" TEXT,
    "grantDate" TIMESTAMP(3),
    "grantNumber" TEXT,
    "priorityDateStart" TIMESTAMP(3),
    "priorityDateEnd" TIMESTAMP(3),
    "priorityDate" TIMESTAMP(3),
    "trademarkText" TEXT,
    "trademarkImage" TEXT,
    "niceClassification" TEXT,
    "registrationNumber" TEXT,
    "applicantChinese" TEXT,
    "applicantEnglish" TEXT,
    "addressChinese" TEXT,
    "addressEnglish" TEXT,
    "sharedOwner" TEXT,
    "exclusiveRightStartDate" TIMESTAMP(3),
    "exclusiveRightEndDate" TIMESTAMP(3),
    "group" TEXT,
    "specification" TEXT,
    "trademarkProcess" TEXT,
    "opposition" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Case_Job_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Case_Job_Task" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "caseJobId" TEXT NOT NULL,
    "taskStatusId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Case_Job_Task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Case_Job_Task_Activity" (
    "id" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "taskId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Case_Job_Task_Activity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Case_Job_Task_Activity_Media" (
    "activityId" TEXT NOT NULL,
    "mediaId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Case_Job_Task_Activity_Media_pkey" PRIMARY KEY ("activityId","mediaId")
);

-- CreateTable
CREATE TABLE "Client_Activity" (
    "id" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "clientId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Client_Activity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Client_Activity_Media" (
    "activityId" TEXT NOT NULL,
    "mediaId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Client_Activity_Media_pkey" PRIMARY KEY ("activityId","mediaId")
);

-- CreateTable
CREATE TABLE "MetaData" (
    "id" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "value" TEXT,
    "jsonValue" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "MetaData_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Quotation" (
    "id" TEXT NOT NULL,
    "refNo" SERIAL NOT NULL,
    "issueDate" TIMESTAMP(3),
    "validDate" TIMESTAMP(3),
    "subject" TEXT NOT NULL,
    "templateType" TEXT NOT NULL,
    "jsonValue" JSONB,
    "clientId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Quotation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Contract" (
    "id" TEXT NOT NULL,
    "refNo" SERIAL NOT NULL,
    "issueDate" TIMESTAMP(3),
    "dateOfConfirmation" TIMESTAMP(3),
    "confirmationDate" TIMESTAMP(3),
    "job" TEXT,
    "jobDescription" TEXT,
    "body" TEXT,
    "clientId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "caseId" TEXT NOT NULL,

    CONSTRAINT "Contract_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Case_Record" (
    "id" TEXT NOT NULL,
    "companyName" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "process" TEXT NOT NULL,
    "contractDate" TIMESTAMP(3) NOT NULL,
    "projectDeadline" TIMESTAMP(3) NOT NULL,
    "actualCompletionDate" TIMESTAMP(3) NOT NULL,
    "contractAmount" DOUBLE PRECISION NOT NULL,
    "amountReceived" DOUBLE PRECISION NOT NULL,
    "balanceDue" DOUBLE PRECISION NOT NULL,
    "totalExpense" DOUBLE PRECISION NOT NULL,
    "profit" DOUBLE PRECISION NOT NULL,
    "contactPerson" TEXT NOT NULL,
    "contactNumber" TEXT NOT NULL,
    "correspondenceAddress" TEXT NOT NULL,
    "corresspondenceEmail" TEXT NOT NULL,
    "projectStatus" TEXT NOT NULL,
    "applicationSubmittedDate" TIMESTAMP(3) NOT NULL,
    "projectStartDate" TIMESTAMP(3) NOT NULL,
    "projectEndDate" TIMESTAMP(3) NOT NULL,
    "projectPeriod" TEXT NOT NULL,
    "fundingProjectAmount" DOUBLE PRECISION NOT NULL,
    "approvedAmount" DOUBLE PRECISION NOT NULL,
    "projectDetails" TEXT NOT NULL,
    "projectContactPerson" TEXT NOT NULL,
    "proectContactNumber" TEXT NOT NULL,
    "projectContactEmail" TEXT NOT NULL,
    "loginLink" TEXT NOT NULL,
    "emailLoginUsername" TEXT NOT NULL,
    "emailLoginPassword" TEXT NOT NULL,
    "fundingSchemeUsername" TEXT NOT NULL,
    "fundingSchemePassword" TEXT NOT NULL,
    "secretariatContactPerson" TEXT NOT NULL,
    "secretariatContactNumber" TEXT NOT NULL,
    "secretariatContactEmail" TEXT NOT NULL,
    "remarks" TEXT,
    "createdBy" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Case_Record_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Invoice" (
    "id" TEXT NOT NULL,
    "caseId" TEXT NOT NULL,
    "invoiceId" SERIAL NOT NULL,
    "issueDate" TIMESTAMP(3),
    "status" "PaymentStatus" NOT NULL DEFAULT 'Unpaid',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "totalAmount" DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    "discount" DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    "discountUnit" "DiscountUnit" NOT NULL DEFAULT 'Cash',
    "discountedAmount" DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    "currencyAmount" DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    "currency" TEXT NOT NULL DEFAULT '',
    "subject" TEXT NOT NULL DEFAULT '',
    "remark" TEXT NOT NULL DEFAULT '',
    "clientId" TEXT NOT NULL,
    "consultantId" TEXT NOT NULL,

    CONSTRAINT "Invoice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Payment" (
    "id" TEXT NOT NULL,
    "receiptId" SERIAL NOT NULL,
    "receivedDate" TIMESTAMP(3) NOT NULL,
    "amountPaid" DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    "invoiceId" TEXT NOT NULL,
    "bankName" TEXT,
    "chequeNumber" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Payment_Media" (
    "id" TEXT NOT NULL,
    "mediaId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),
    "paymentId" TEXT NOT NULL,

    CONSTRAINT "Payment_Media_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Job_Invoice" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "caseJobId" TEXT NOT NULL,
    "invoiceId" TEXT NOT NULL,

    CONSTRAINT "Job_Invoice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Case_Media" (
    "id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "mediaId" TEXT NOT NULL,
    "caseId" TEXT NOT NULL,
    "ref_id" TEXT,
    "accessibility" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),
    "case_CostingId" TEXT,

    CONSTRAINT "Case_Media_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Case_Costing" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "caseId" TEXT NOT NULL,
    "agentId" TEXT,
    "currencyAmount" DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    "currency" TEXT NOT NULL DEFAULT '',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Case_Costing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Alarm" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "caseId" TEXT,
    "date" TIMESTAMP(3) NOT NULL,
    "status" "AlarmStatus" NOT NULL DEFAULT 'upcoming',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "case_Job_Task_ActivityId" TEXT,

    CONSTRAINT "Alarm_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Alarm_Reminder" (
    "id" TEXT NOT NULL,
    "duration" INTEGER NOT NULL,
    "type" "ReminderType" NOT NULL,
    "reminderDate" TIMESTAMP(3) NOT NULL,
    "alarmId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Alarm_Reminder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Alarm_Staff" (
    "id" TEXT NOT NULL,
    "alarmId" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Alarm_Staff_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Alarm_Client" (
    "id" TEXT NOT NULL,
    "alarmId" TEXT NOT NULL,
    "clientId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Alarm_Client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Task_Status" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Task_Status_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notification" (
    "id" TEXT NOT NULL,
    "ref_type" TEXT,
    "ref_id" TEXT,
    "senderId" TEXT,
    "message" TEXT NOT NULL,
    "redirect" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notification_Receiver" (
    "id" TEXT NOT NULL,
    "receiverId" TEXT NOT NULL,
    "notificationId" TEXT NOT NULL,
    "isRead" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Notification_Receiver_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Staff_staffId_key" ON "Staff"("staffId");

-- CreateIndex
CREATE UNIQUE INDEX "staffs_email_deleted_at" ON "Staff"("email", "deletedAt");

-- CreateIndex
CREATE UNIQUE INDEX "staffs_username_deleted_at" ON "Staff"("username", "deletedAt");

-- CreateIndex
CREATE UNIQUE INDEX "Client_clientId_key" ON "Client"("clientId");

-- CreateIndex
CREATE UNIQUE INDEX "clients_email_deleted_at" ON "Client"("email", "deletedAt");

-- CreateIndex
CREATE UNIQUE INDEX "clients_username_deleted_at" ON "Client"("username", "deletedAt");

-- CreateIndex
CREATE UNIQUE INDEX "Agent_agentId_key" ON "Agent"("agentId");

-- CreateIndex
CREATE UNIQUE INDEX "agents_email_deleted_at" ON "Agent"("email", "deletedAt");

-- CreateIndex
CREATE UNIQUE INDEX "agents_username_deleted_at" ON "Agent"("username", "deletedAt");

-- CreateIndex
CREATE UNIQUE INDEX "Media_key_key" ON "Media"("key");

-- CreateIndex
CREATE UNIQUE INDEX "Case_caseId_key" ON "Case"("caseId");

-- CreateIndex
CREATE UNIQUE INDEX "MetaData_key_key" ON "MetaData"("key");

-- CreateIndex
CREATE UNIQUE INDEX "Quotation_refNo_key" ON "Quotation"("refNo");

-- CreateIndex
CREATE UNIQUE INDEX "Contract_refNo_key" ON "Contract"("refNo");

-- CreateIndex
CREATE UNIQUE INDEX "Invoice_invoiceId_key" ON "Invoice"("invoiceId");

-- CreateIndex
CREATE UNIQUE INDEX "Payment_receiptId_key" ON "Payment"("receiptId");

-- AddForeignKey
ALTER TABLE "Staff" ADD CONSTRAINT "Staff_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClientPersonInCharge" ADD CONSTRAINT "ClientPersonInCharge_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClientPersonInCharge" ADD CONSTRAINT "ClientPersonInCharge_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AgentPersonInCharge" ADD CONSTRAINT "AgentPersonInCharge_agentId_fkey" FOREIGN KEY ("agentId") REFERENCES "Agent"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AgentPersonInCharge" ADD CONSTRAINT "AgentPersonInCharge_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActivityLog" ADD CONSTRAINT "ActivityLog_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActivityLog" ADD CONSTRAINT "ActivityLog_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActivityLog" ADD CONSTRAINT "ActivityLog_agentId_fkey" FOREIGN KEY ("agentId") REFERENCES "Agent"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attachment" ADD CONSTRAINT "Attachment_marketingId_fkey" FOREIGN KEY ("marketingId") REFERENCES "Marketing"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attachment" ADD CONSTRAINT "Attachment_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "Media"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MarketingGroup" ADD CONSTRAINT "MarketingGroup_marketingId_fkey" FOREIGN KEY ("marketingId") REFERENCES "Marketing"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MarketingReceiver" ADD CONSTRAINT "MarketingReceiver_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "MarketingGroup"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EForm" ADD CONSTRAINT "EForm_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "Media"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case" ADD CONSTRAINT "Case_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case" ADD CONSTRAINT "Case_workId_fkey" FOREIGN KEY ("workId") REFERENCES "Work"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_PersonInCharge" ADD CONSTRAINT "Case_PersonInCharge_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_PersonInCharge" ADD CONSTRAINT "Case_PersonInCharge_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_AgentInCharge" ADD CONSTRAINT "Case_AgentInCharge_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_AgentInCharge" ADD CONSTRAINT "Case_AgentInCharge_agentId_fkey" FOREIGN KEY ("agentId") REFERENCES "Agent"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_DynamicInputField" ADD CONSTRAINT "Case_DynamicInputField_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "Media"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_DynamicInputField" ADD CONSTRAINT "Case_DynamicInputField_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Job" ADD CONSTRAINT "Case_Job_jurisdictionId_fkey" FOREIGN KEY ("jurisdictionId") REFERENCES "Jurisdiction"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Job" ADD CONSTRAINT "Case_Job_classId_fkey" FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Job" ADD CONSTRAINT "Case_Job_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Job" ADD CONSTRAINT "Case_Job_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Job_Task" ADD CONSTRAINT "Case_Job_Task_caseJobId_fkey" FOREIGN KEY ("caseJobId") REFERENCES "Case_Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Job_Task" ADD CONSTRAINT "Case_Job_Task_taskStatusId_fkey" FOREIGN KEY ("taskStatusId") REFERENCES "Task_Status"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Job_Task_Activity" ADD CONSTRAINT "Case_Job_Task_Activity_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Job_Task_Activity" ADD CONSTRAINT "Case_Job_Task_Activity_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Case_Job_Task"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Job_Task_Activity_Media" ADD CONSTRAINT "Case_Job_Task_Activity_Media_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES "Case_Job_Task_Activity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Job_Task_Activity_Media" ADD CONSTRAINT "Case_Job_Task_Activity_Media_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "Media"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Client_Activity" ADD CONSTRAINT "Client_Activity_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Client_Activity" ADD CONSTRAINT "Client_Activity_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Client_Activity_Media" ADD CONSTRAINT "Client_Activity_Media_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES "Client_Activity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Client_Activity_Media" ADD CONSTRAINT "Client_Activity_Media_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "Media"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Quotation" ADD CONSTRAINT "Quotation_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Quotation" ADD CONSTRAINT "Quotation_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contract" ADD CONSTRAINT "Contract_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contract" ADD CONSTRAINT "Contract_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contract" ADD CONSTRAINT "Contract_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_consultantId_fkey" FOREIGN KEY ("consultantId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment_Media" ADD CONSTRAINT "Payment_Media_paymentId_fkey" FOREIGN KEY ("paymentId") REFERENCES "Payment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment_Media" ADD CONSTRAINT "Payment_Media_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "Media"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Job_Invoice" ADD CONSTRAINT "Job_Invoice_caseJobId_fkey" FOREIGN KEY ("caseJobId") REFERENCES "Case_Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Job_Invoice" ADD CONSTRAINT "Job_Invoice_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Media" ADD CONSTRAINT "Case_Media_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "Media"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Media" ADD CONSTRAINT "Case_Media_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Media" ADD CONSTRAINT "Case_Media_case_CostingId_fkey" FOREIGN KEY ("case_CostingId") REFERENCES "Case_Costing"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Costing" ADD CONSTRAINT "Case_Costing_agentId_fkey" FOREIGN KEY ("agentId") REFERENCES "Agent"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Case_Costing" ADD CONSTRAINT "Case_Costing_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Alarm" ADD CONSTRAINT "Alarm_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Alarm" ADD CONSTRAINT "Alarm_case_Job_Task_ActivityId_fkey" FOREIGN KEY ("case_Job_Task_ActivityId") REFERENCES "Case_Job_Task_Activity"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Alarm_Reminder" ADD CONSTRAINT "Alarm_Reminder_alarmId_fkey" FOREIGN KEY ("alarmId") REFERENCES "Alarm"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Alarm_Staff" ADD CONSTRAINT "Alarm_Staff_alarmId_fkey" FOREIGN KEY ("alarmId") REFERENCES "Alarm"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Alarm_Staff" ADD CONSTRAINT "Alarm_Staff_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Alarm_Client" ADD CONSTRAINT "Alarm_Client_alarmId_fkey" FOREIGN KEY ("alarmId") REFERENCES "Alarm"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Alarm_Client" ADD CONSTRAINT "Alarm_Client_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "Staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification_Receiver" ADD CONSTRAINT "Notification_Receiver_receiverId_fkey" FOREIGN KEY ("receiverId") REFERENCES "Staff"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification_Receiver" ADD CONSTRAINT "Notification_Receiver_notificationId_fkey" FOREIGN KEY ("notificationId") REFERENCES "Notification"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
