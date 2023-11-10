-- DropForeignKey
ALTER TABLE "EForm" DROP CONSTRAINT "EForm_mediaId_fkey";

-- AlterTable
ALTER TABLE "EForm" ALTER COLUMN "mediaId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "EForm" ADD CONSTRAINT "EForm_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "Media"("id") ON DELETE SET NULL ON UPDATE CASCADE;
