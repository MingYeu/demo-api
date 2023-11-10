/*
  Warnings:

  - You are about to drop the column `addressChinese` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `addressEnglish` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `applicant` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `applicantChinese` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `applicantEnglish` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `applicationNumber` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `clientApproachDate` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `currentOAStatus` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `exclusiveRightEndDate` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `exclusiveRightStartDate` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `filingDate` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `grantDate` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `grantNumber` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `group` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `inventor` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `legalStatus` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `maintenanceRenewal` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `nextRenewalDate` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `niceClassification` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `oaIssueDate` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `opposition` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `priorityDate` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `priorityDateEnd` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `priorityDateStart` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `publicationDate` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `publicationNumber` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `registrationNumber` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `sharedOwner` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `specification` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `trademarkImage` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `trademarkProcess` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `trademarkText` on the `Case_Job` table. All the data in the column will be lost.
  - You are about to drop the column `type` on the `Case_Job` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Case_Job" DROP COLUMN "addressChinese",
DROP COLUMN "addressEnglish",
DROP COLUMN "applicant",
DROP COLUMN "applicantChinese",
DROP COLUMN "applicantEnglish",
DROP COLUMN "applicationNumber",
DROP COLUMN "clientApproachDate",
DROP COLUMN "currentOAStatus",
DROP COLUMN "exclusiveRightEndDate",
DROP COLUMN "exclusiveRightStartDate",
DROP COLUMN "filingDate",
DROP COLUMN "grantDate",
DROP COLUMN "grantNumber",
DROP COLUMN "group",
DROP COLUMN "inventor",
DROP COLUMN "legalStatus",
DROP COLUMN "maintenanceRenewal",
DROP COLUMN "nextRenewalDate",
DROP COLUMN "niceClassification",
DROP COLUMN "oaIssueDate",
DROP COLUMN "opposition",
DROP COLUMN "priorityDate",
DROP COLUMN "priorityDateEnd",
DROP COLUMN "priorityDateStart",
DROP COLUMN "publicationDate",
DROP COLUMN "publicationNumber",
DROP COLUMN "registrationNumber",
DROP COLUMN "sharedOwner",
DROP COLUMN "specification",
DROP COLUMN "title",
DROP COLUMN "trademarkImage",
DROP COLUMN "trademarkProcess",
DROP COLUMN "trademarkText",
DROP COLUMN "type",
ADD COLUMN     "trademarkId" TEXT;

-- AlterTable
ALTER TABLE "Department" ADD COLUMN     "TEMPLATE_CREATE" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "TEMPLATE_DELETE" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "TEMPLATE_UPDATE" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "TEMPLATE_VIEW" BOOLEAN NOT NULL DEFAULT false;

-- CreateTable
CREATE TABLE "Trademark" (
    "id" TEXT NOT NULL,
    "trademarkText" TEXT,
    "trademarkimage" TEXT,
    "niceClassification" TEXT,
    "formOfTrademark" TEXT,
    "typeOfTrademark" TEXT,
    "applicationNumber" TEXT,
    "registrationNumber" TEXT,
    "applicantChinese" TEXT,
    "applicantEnglish" TEXT,
    "addressChinese" TEXT,
    "addressEnglish" TEXT,
    "contactPerson" TEXT,
    "contactNumber" TEXT,
    "correspondenceAddress" TEXT,
    "correspondenceEmail" TEXT,
    "sharedOwner" TEXT,
    "filingDate" TIMESTAMP(3),
    "filingReceipt" TIMESTAMP(3),
    "publicationDate" TIMESTAMP(3),
    "registrationDate" TIMESTAMP(3),
    "certificationNumber" TEXT,
    "certificationTracker" TIMESTAMP(3),
    "exclusiveRightStartDate" TIMESTAMP(3),
    "exclusiveRightEndDate" TIMESTAMP(3),
    "group" TEXT,
    "specification" TEXT,
    "legalStatus" TEXT,
    "currentOAStatus" TEXT,
    "oaIssueDate" TIMESTAMP(3),
    "oaClientApproachDate" TIMESTAMP(3),
    "oaResponseDeadline" TIMESTAMP(3),
    "oaResponseDate" TIMESTAMP(3),
    "trademarkProcess" TEXT,
    "maintenanceRenewal" TIMESTAMP(3),
    "nextRenewalDate" TIMESTAMP(3),
    "oppositionDate" TIMESTAMP(3),
    "oppositionClientApproachDate" TIMESTAMP(3),
    "oppositionResponseDate" TIMESTAMP(3),
    "oppositionDetails" TEXT,
    "revocationOfRegisteredTrademark" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Trademark_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Template" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "value" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Template_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Case_Job" ADD CONSTRAINT "Case_Job_trademarkId_fkey" FOREIGN KEY ("trademarkId") REFERENCES "Trademark"("id") ON DELETE SET NULL ON UPDATE CASCADE;
