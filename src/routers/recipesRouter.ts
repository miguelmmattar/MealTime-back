import express from "express";
import authorizations from "../middlewares/authorizations.js";
import scheemas from "../middlewares/scheemas.js";
import recipesController from "../controllers/recipesController.js";

const router = express.Router();
router.use(authorizations.authorize);

router.post("/recipes", scheemas.newRecipeSchema, recipesController.postNewRecipe);
router.get("/recipes", recipesController.listRecipes);
router.get("/categories", recipesController.listCategories);
router.delete("/recipes/:recipeId", authorizations.allowDelete, recipesController.deleteRecipe);


export default router;