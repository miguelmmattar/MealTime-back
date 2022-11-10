import { Request, Response } from "express";
import { Recipe,NewRecipe } from "../protocols/Recipe.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import recipeRepository from "../repositories/recipesRepository.js";
import { QueryResult } from "pg";
import { Category } from "../protocols/Category.js";

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
    listCategories
}