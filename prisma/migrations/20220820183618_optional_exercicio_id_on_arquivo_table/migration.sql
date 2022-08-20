-- DropForeignKey
ALTER TABLE "Arquivo" DROP CONSTRAINT "Arquivo_exercicioId_fkey";

-- AlterTable
ALTER TABLE "Arquivo" ALTER COLUMN "exercicioId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Arquivo" ADD CONSTRAINT "Arquivo_exercicioId_fkey" FOREIGN KEY ("exercicioId") REFERENCES "Exercicio"("id") ON DELETE SET NULL ON UPDATE CASCADE;
