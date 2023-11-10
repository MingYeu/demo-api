/*
  Warnings:

  - You are about to drop the column `status` on the `Case` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "CaseStatus" AS ENUM ('open', 'close', 'complete');

-- AlterTable
ALTER TABLE "Case" DROP COLUMN "status",
ADD COLUMN     "caseStatus" "CaseStatus" DEFAULT 'open',
ADD COLUMN     "workStatus" TEXT;
