/*
  Warnings:

  - Added the required column `status` to the `EForm` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "EForm" ADD COLUMN     "status" BOOLEAN NOT NULL;
