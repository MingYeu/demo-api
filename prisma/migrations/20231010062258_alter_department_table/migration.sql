/*
  Warnings:

  - You are about to drop the column `JOB_MASTER_LISTING` on the `Department` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Department" DROP COLUMN "JOB_MASTER_LISTING",
ADD COLUMN     "JOB_VIEW" BOOLEAN NOT NULL DEFAULT false;
