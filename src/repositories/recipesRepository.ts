import connection from "../database/Postgres.js";
import { Recipe, NewRecipe } from "../protocols/Recipe.js";
import { Filter } from "../protocols/Filter.js";

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
        `, [recipeId.rows[0].id, item.id]);

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

    await connection.query(`
        INSERT INTO
            images (url, "recipeId")
        VALUES ($1, $2);
    `, [recipe.image, recipeId.rows[0].id]);
   
    return recipeId.rows[0].id;
}

function getRecipes(filter: Filter) {
    let param: string;
    let info: string | number;

    if(filter.category) {
        param = `WHERE categories.id = $1`;
        info = filter.category;
    }

    if(filter.search) {
        param = `WHERE recipes.name LIKE $1`;
        info = filter.search;
    }

    if(filter.category && filter.search) {
        param = `WHERE categories.id = $1 AND recipes.name LIKE $2`;
    }

    const baseQuery = `
        SELECT
            recipes.id AS id,
            recipes.name AS name,
            recipes.serves AS serves,
            recipes."prepTime" AS "prepTime",
            recipes.method AS method,
            images.url AS image,
            json_agg(DISTINCT jsonb_build_object(
                'id', categories.id,
                'name', categories.name
            )) AS category,
            json_agg(json_build_object(
                'name', ingredients.name,
                'quantity', "recipes/ingredients".quantity 
            )) AS ingredients,
            json_build_object(
                'id', users.id,
                'name', users.name
            ) AS by
        FROM 
            recipes
        JOIN users
            ON recipes."userId" = users.id
        LEFT JOIN images
            ON recipes.id = images."recipeId"
        JOIN "recipes/categories"
            ON recipes.id = "recipes/categories"."recipeId"
        JOIN categories
            ON "recipes/categories"."categoryId" = categories.id
        JOIN "recipes/ingredients"
            ON recipes.id = "recipes/ingredients"."recipeId"
        JOIN ingredients
            ON "recipes/ingredients"."ingredientId" = ingredients.id
    `;

    if(!param) {
        const query = `
        ${baseQuery} 
        GROUP BY recipes.id, images.url, users.id;
    `
        return connection.query(`
            ${baseQuery} 
            GROUP BY recipes.id, images.url, users.id;
        `);
    }

    if(filter.category && filter.search) {
        return connection.query(`
            ${baseQuery}
            ${param}
            GROUP BY recipes.id, images.url, users.id;
        `, [filter.category, filter.search]);
    }

    return connection.query(`
        ${baseQuery}
        ${param}
        GROUP BY recipes.id, images.url, users.id;
    `, [info]);

}

function getCategories() {
    return connection.query(`
        SELECT 
            *
        FROM categories;
    `);
}

function getRecipeOwner(recipeId: number)  {
    return connection.query(`
        SELECT 
            "userId" AS id
        FROM recipes
            WHERE recipes.id = $1;
    `, [recipeId]);
}

function deleteRecipe(recipeId: number) {
    return connection.query(`
        DELETE FROM
            recipes
        WHERE id = $1;
    `, [recipeId]);
}

export default {
    postRecipe,
    getRecipes,
    getCategories,
    getRecipeOwner,
    deleteRecipe
}