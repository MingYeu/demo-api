/*
  Warnings:

  - You are about to drop the column `trademarkimage` on the `Trademark` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Trademark" DROP COLUMN "trademarkimage",
ADD COLUMN     "trademarkImage" TEXT;
