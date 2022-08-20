-- CreateTable
CREATE TABLE "Arquivo" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "tamanho" INTEGER NOT NULL,
    "caminho" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "exercicioId" INTEGER,

    CONSTRAINT "Arquivo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "email" TEXT,
    "senha" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "pessoaId" INTEGER,
    "perfilId" INTEGER NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Perfil" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Perfil_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pessoa" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "enderecoId" INTEGER NOT NULL,
    "arquivoId" INTEGER NOT NULL,
    "fichaDeTreinoId" INTEGER,

    CONSTRAINT "Pessoa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Endereco" (
    "id" SERIAL NOT NULL,
    "logradouro" TEXT NOT NULL,
    "numero" INTEGER NOT NULL,
    "bairro" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "estadoId" INTEGER NOT NULL,

    CONSTRAINT "Endereco_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Estado" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Estado_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DiaDaSemana" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "fichaDeTreinoId" INTEGER,

    CONSTRAINT "DiaDaSemana_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Categoria" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "variaveisDeExercicioId" INTEGER,

    CONSTRAINT "Categoria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Exercicio" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "categoriaId" INTEGER NOT NULL,
    "fichaDeTreinoId" INTEGER,

    CONSTRAINT "Exercicio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VariaveisDeExercicio" (
    "id" SERIAL NOT NULL,
    "repeticoes" INTEGER NOT NULL,
    "series" INTEGER NOT NULL,
    "carga" INTEGER NOT NULL,
    "tempoDeDescanso" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "fichaDeTreinoId" INTEGER,

    CONSTRAINT "VariaveisDeExercicio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FichaDeTreino" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "criadaPorId" INTEGER NOT NULL,
    "atualidaPorId" INTEGER NOT NULL,

    CONSTRAINT "FichaDeTreino_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DiaTreino" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "diaDaSemanaId" INTEGER NOT NULL,

    CONSTRAINT "DiaTreino_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_DiaDaSemanaToDiaTreino" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_DiaTreinoToFichaDeTreino" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_DiaTreinoToExercicio" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Pessoa_cpf_key" ON "Pessoa"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "DiaDaSemana_nome_key" ON "DiaDaSemana"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "Categoria_nome_key" ON "Categoria"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "Exercicio_nome_key" ON "Exercicio"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "FichaDeTreino_nome_key" ON "FichaDeTreino"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "DiaTreino_nome_key" ON "DiaTreino"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "_DiaDaSemanaToDiaTreino_AB_unique" ON "_DiaDaSemanaToDiaTreino"("A", "B");

-- CreateIndex
CREATE INDEX "_DiaDaSemanaToDiaTreino_B_index" ON "_DiaDaSemanaToDiaTreino"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_DiaTreinoToFichaDeTreino_AB_unique" ON "_DiaTreinoToFichaDeTreino"("A", "B");

-- CreateIndex
CREATE INDEX "_DiaTreinoToFichaDeTreino_B_index" ON "_DiaTreinoToFichaDeTreino"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_DiaTreinoToExercicio_AB_unique" ON "_DiaTreinoToExercicio"("A", "B");

-- CreateIndex
CREATE INDEX "_DiaTreinoToExercicio_B_index" ON "_DiaTreinoToExercicio"("B");

-- AddForeignKey
ALTER TABLE "Arquivo" ADD CONSTRAINT "Arquivo_exercicioId_fkey" FOREIGN KEY ("exercicioId") REFERENCES "Exercicio"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_perfilId_fkey" FOREIGN KEY ("perfilId") REFERENCES "Perfil"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_pessoaId_fkey" FOREIGN KEY ("pessoaId") REFERENCES "Pessoa"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pessoa" ADD CONSTRAINT "Pessoa_arquivoId_fkey" FOREIGN KEY ("arquivoId") REFERENCES "Arquivo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pessoa" ADD CONSTRAINT "Pessoa_enderecoId_fkey" FOREIGN KEY ("enderecoId") REFERENCES "Endereco"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pessoa" ADD CONSTRAINT "Pessoa_fichaDeTreinoId_fkey" FOREIGN KEY ("fichaDeTreinoId") REFERENCES "FichaDeTreino"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Endereco" ADD CONSTRAINT "Endereco_estadoId_fkey" FOREIGN KEY ("estadoId") REFERENCES "Estado"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Categoria" ADD CONSTRAINT "Categoria_variaveisDeExercicioId_fkey" FOREIGN KEY ("variaveisDeExercicioId") REFERENCES "VariaveisDeExercicio"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Exercicio" ADD CONSTRAINT "Exercicio_categoriaId_fkey" FOREIGN KEY ("categoriaId") REFERENCES "Categoria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Exercicio" ADD CONSTRAINT "Exercicio_fichaDeTreinoId_fkey" FOREIGN KEY ("fichaDeTreinoId") REFERENCES "FichaDeTreino"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VariaveisDeExercicio" ADD CONSTRAINT "VariaveisDeExercicio_fichaDeTreinoId_fkey" FOREIGN KEY ("fichaDeTreinoId") REFERENCES "FichaDeTreino"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FichaDeTreino" ADD CONSTRAINT "FichaDeTreino_criadaPorId_fkey" FOREIGN KEY ("criadaPorId") REFERENCES "Pessoa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FichaDeTreino" ADD CONSTRAINT "FichaDeTreino_atualidaPorId_fkey" FOREIGN KEY ("atualidaPorId") REFERENCES "Pessoa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DiaDaSemanaToDiaTreino" ADD CONSTRAINT "_DiaDaSemanaToDiaTreino_A_fkey" FOREIGN KEY ("A") REFERENCES "DiaDaSemana"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DiaDaSemanaToDiaTreino" ADD CONSTRAINT "_DiaDaSemanaToDiaTreino_B_fkey" FOREIGN KEY ("B") REFERENCES "DiaTreino"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DiaTreinoToFichaDeTreino" ADD CONSTRAINT "_DiaTreinoToFichaDeTreino_A_fkey" FOREIGN KEY ("A") REFERENCES "DiaTreino"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DiaTreinoToFichaDeTreino" ADD CONSTRAINT "_DiaTreinoToFichaDeTreino_B_fkey" FOREIGN KEY ("B") REFERENCES "FichaDeTreino"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DiaTreinoToExercicio" ADD CONSTRAINT "_DiaTreinoToExercicio_A_fkey" FOREIGN KEY ("A") REFERENCES "DiaTreino"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DiaTreinoToExercicio" ADD CONSTRAINT "_DiaTreinoToExercicio_B_fkey" FOREIGN KEY ("B") REFERENCES "Exercicio"("id") ON DELETE CASCADE ON UPDATE CASCADE;
