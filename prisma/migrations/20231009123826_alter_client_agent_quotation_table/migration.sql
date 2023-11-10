-- AlterTable
ALTER TABLE "Agent" ADD COLUMN     "displayId" TEXT,
ADD COLUMN     "refId" TEXT;

-- AlterTable
ALTER TABLE "Client" ADD COLUMN     "displayId" TEXT,
ADD COLUMN     "refId" TEXT;

-- AlterTable
ALTER TABLE "Quotation" ADD COLUMN     "displayId" TEXT,
ADD COLUMN     "refId" TEXT;
