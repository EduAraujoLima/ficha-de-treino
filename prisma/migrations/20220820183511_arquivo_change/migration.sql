/*
  Warnings:

  - You are about to drop the column `arquivoId` on the `Pessoa` table. All the data in the column will be lost.
  - Added the required column `criadorPorId` to the `Arquivo` table without a default value. This is not possible if the table is not empty.
  - Made the column `exercicioId` on table `Arquivo` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `fotoDePerfilId` to the `Pessoa` table without a default value. This is not possible if the table is not empty.
  - Made the column `fichaDeTreinoId` on table `Pessoa` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Arquivo" DROP CONSTRAINT "Arquivo_exercicioId_fkey";

-- DropForeignKey
ALTER TABLE "Pessoa" DROP CONSTRAINT "Pessoa_arquivoId_fkey";

-- DropForeignKey
ALTER TABLE "Pessoa" DROP CONSTRAINT "Pessoa_fichaDeTreinoId_fkey";

-- AlterTable
ALTER TABLE "Arquivo" ADD COLUMN     "criadorPorId" INTEGER NOT NULL,
ADD COLUMN     "publico" BOOLEAN NOT NULL DEFAULT false,
ALTER COLUMN "exercicioId" SET NOT NULL;

-- AlterTable
ALTER TABLE "Pessoa" DROP COLUMN "arquivoId",
ADD COLUMN     "fotoDePerfilId" INTEGER NOT NULL,
ALTER COLUMN "fichaDeTreinoId" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "Arquivo" ADD CONSTRAINT "Arquivo_criadorPorId_fkey" FOREIGN KEY ("criadorPorId") REFERENCES "Pessoa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Arquivo" ADD CONSTRAINT "Arquivo_exercicioId_fkey" FOREIGN KEY ("exercicioId") REFERENCES "Exercicio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pessoa" ADD CONSTRAINT "Pessoa_fotoDePerfilId_fkey" FOREIGN KEY ("fotoDePerfilId") REFERENCES "Arquivo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pessoa" ADD CONSTRAINT "Pessoa_fichaDeTreinoId_fkey" FOREIGN KEY ("fichaDeTreinoId") REFERENCES "FichaDeTreino"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
