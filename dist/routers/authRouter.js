import express from "express";
import authorizations from "../middlewares/authorizations";
import authController from "../controllers/authController";
var router = express.Router();
router.post("/sign-up", authorizations.allowSignUp, authController.signUp);
router.post("/sign-in", authorizations.allowSignIn, authController.signIn);
export default router;
