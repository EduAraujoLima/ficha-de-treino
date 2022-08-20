import { createRouter } from './context';
export const variaveisDeTreinoRouter = createRouter()
.query('getAll', {
    resolve: async({ctx}) => {
        return await ctx.prisma.variaveisDeExercicio.findMany()
    }
})