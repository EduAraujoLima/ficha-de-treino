// src/server/router/index.ts
import { createRouter } from "./context";
import superjson from "superjson";
import { variaveisDeTreinoRouter } from "./variaveisDeTreino";
//import { exampleRouter } from "./example";
//import { protectedExampleRouter } from "./protected-example-router";

export const appRouter = createRouter()
  .transformer(superjson)
  .merge("variaveis.", variaveisDeTreinoRouter)
  //.merge("question.", protectedExampleRouter);

// export type definition of API
export type AppRouter = typeof appRouter;
