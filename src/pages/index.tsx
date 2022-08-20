import { Button } from '@chakra-ui/react'
import { VariaveisDeExercicio } from '@prisma/client';
import type { NextPage } from 'next'
import React from 'react'
import styles from '../styles/Home.module.css'
import { trpc } from "../utils/trpc";

const Home: NextPage = () => {

  const variaveis = trpc.useQuery(["variaveis.getAll"])
  return (
    <div className={styles.container}>
      {variaveis.data && variaveis.data.map(v => (
        <div key={v.id}>
          <h1>{v.nome}</h1>
        </div>
      ))}
    </div>
  )
}

export default Home
