/*
  Warnings:

  - You are about to drop the column `ALARM_VIEW` on the `Department` table. All the data in the column will be lost.
  - You are about to drop the column `JOB_VIEW` on the `Department` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Department" DROP COLUMN "ALARM_VIEW",
DROP COLUMN "JOB_VIEW",
ADD COLUMN     "ALARM_MASTER_LISTING" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "CASE_ALARM_CREATE" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "CASE_ALARM_DELETE" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "CASE_ALARM_UPDATE" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "CASE_ALARM_VIEW" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "INCENTIVE_CREATE" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "INCENTIVE_DELETE" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "INCENTIVE_UPDATE" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "INCENTIVE_VIEW" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "JOB_MASTER_LISTING" BOOLEAN NOT NULL DEFAULT false;

-- CreateTable
CREATE TABLE "Case_Incentive" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "currencyAmount" DOUBLE PRECISION NOT NULL DEFAULT 0.00,
    "currency" TEXT NOT NULL DEFAULT '',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "caseId" TEXT NOT NULL,

    CONSTRAINT "Case_Incentive_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Alarm_Media" (
    "id" TEXT NOT NULL,
    "mediaId" TEXT NOT NULL,
    "alarmId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMPTZ(6),

    CONSTRAINT "Alarm_Media_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Case_Incentive" ADD CONSTRAINT "Case_Incentive_caseId_fkey" FOREIGN KEY ("caseId") REFERENCES "Case"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Alarm_Media" ADD CONSTRAINT "Alarm_Media_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "Media"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Alarm_Media" ADD CONSTRAINT "Alarm_Media_alarmId_fkey" FOREIGN KEY ("alarmId") REFERENCES "Alarm"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
