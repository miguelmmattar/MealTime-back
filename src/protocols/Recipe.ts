export type Recipe = {
    id: number,
    name: string,
    serves: number,
    prepTime: number,
    method: string,
    image: string | null,
    category: {
        id: number,
        name: string
    }[],
    ingredients: {
        name: string,
        quantity?: string
    }[],
    by: {
        id: number,
        name: string
    }
}

export type NewRecipe = Omit<Recipe, "id">