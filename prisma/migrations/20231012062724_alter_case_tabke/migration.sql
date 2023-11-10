/*
  Warnings:

  - Added the required column `type` to the `Case` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "WorkType" AS ENUM ('Trademark', 'Patent', 'Copyright', 'Design_Patent', 'Funding');

-- AlterTable
ALTER TABLE "Case" ADD COLUMN     "type" "WorkType" NOT NULL;
