/*
  Warnings:

  - Made the column `caseStatus` on table `Case` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Case" ALTER COLUMN "caseStatus" SET NOT NULL;
