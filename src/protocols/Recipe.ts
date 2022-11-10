export type Recipe = {
    id: number,
    name: string,
    serves: number,
    prepTime: number,
    method: string,
    image: string | null,
    category: number[],
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