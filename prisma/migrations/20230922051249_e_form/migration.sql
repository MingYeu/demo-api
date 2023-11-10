/*
  Warnings:

  - Made the column `mediaId` on table `EForm` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "EForm" DROP CONSTRAINT "EForm_mediaId_fkey";

-- AlterTable
ALTER TABLE "EForm" ALTER COLUMN "mediaId" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "EForm" ADD CONSTRAINT "EForm_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "Media"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
