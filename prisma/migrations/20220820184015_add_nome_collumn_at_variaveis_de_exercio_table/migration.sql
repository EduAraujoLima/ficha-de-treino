/*
  Warnings:

  - A unique constraint covering the columns `[nome]` on the table `VariaveisDeExercicio` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `nome` to the `VariaveisDeExercicio` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "VariaveisDeExercicio" ADD COLUMN     "nome" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "VariaveisDeExercicio_nome_key" ON "VariaveisDeExercicio"("nome");
