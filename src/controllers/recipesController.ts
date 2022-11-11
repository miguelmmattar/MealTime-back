import { Request, Response } from "express";
import { Recipe,NewRecipe } from "../protocols/Recipe.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import recipeRepository from "../repositories/recipesRepository.js";
import { QueryResult } from "pg";
import { Category } from "../protocols/Category.js";
import { Filter } from "../protocols/Filter.js";

async function postNewRecipe(req: Request, res: Response) {
    const newRecipe = res.locals.newRecipe as NewRecipe;

    try {
        const recipeId: number = await recipeRepository.postRecipe(newRecipe);

        const recipe: Recipe = {...newRecipe, id: recipeId};

        res.status(STATUS_CODE.OK).send(recipe);
    } catch(error) {
        console.log(error.message);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }
}

async function listRecipes(req: Request, res: Response) {
    const categoryId = Number(req.query.category);
    const search = req.query.search;
    let filter: Filter = {
        category: null,
        search: null
    };

    if(categoryId) {
        filter.category = categoryId;
    }

    if(search) {
        filter.search = `%${search}%`;
    }

    try {
        const recipes: QueryResult<Recipe[]> = await recipeRepository.getRecipes(filter);

        res.status(STATUS_CODE.OK).send(recipes.rows);
    } catch(error) {
        console.log(error.message);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }
}

async function listCategories(req: Request, res: Response) {
    try {
        const categories: QueryResult<Category[]> = await recipeRepository.getCategories();

        res.status(STATUS_CODE.OK).send(categories.rows);
    } catch(error) {
        console.log(error.message);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }
}

export default {
    postNewRecipe,
    listRecipes,
    listCategories
}