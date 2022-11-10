import connection from "../database/Postgres.js";
import { Recipe, NewRecipe } from "../protocols/Recipe.js";

async function postRecipe(recipe: NewRecipe) {
    await connection.query(`
        INSERT INTO 
            recipes ("userId", name, serves, "prepTime", method)
        VALUES ($1, $2, $3, $4, $5);  
    `, [recipe.by.id, recipe.name, recipe.serves, recipe.prepTime, recipe.method]);

    const recipeId = await connection.query(`
        SELECT 
            id 
        FROM recipes 
            WHERE "userId" = $1
        ORDER BY id DESC;
        `, [recipe.by.id]);

    await Promise.all(recipe.category.map(async item => {
        await connection.query(`
            INSERT INTO 
                "recipes/categories" ("recipeId", "categoryId")
            VALUES ($1, $2);  
        `, [recipeId.rows[0].id, item]);

        return 1;
    }));

    let ingredients = await connection.query(`SELECT name FROM ingredients;`);

    await Promise.all(recipe.ingredients.map(async item => {
        if(ingredients.rows.find(ingredient => ingredient.name === item.name)) {
            return 1;
        }

        await connection.query(`
            INSERT INTO
                ingredients (name)
            VALUES ($1)
        `, [item.name]);

        return 1;
    }));

   
    ingredients = await connection.query(`SELECT * FROM ingredients;`);

    await Promise.all(recipe.ingredients.map(async item => {
        const ingredientId: number = ingredients.rows.find(ingredient => ingredient.name === item.name).id;
        
        await connection.query(`
            INSERT INTO 
                "recipes/ingredients" ("recipeId", "ingredientId", quantity)
            VALUES ($1, $2, $3);  
        `, [recipeId.rows[0].id, ingredientId, item.quantity]);

        return 1;
    }));
   
    return recipeId.rows[0].id;
}



function getCategories() {
    return connection.query(`
        SELECT 
            *
        FROM categories;
    `);
}

export default {
    postRecipe,
    getCategories
}