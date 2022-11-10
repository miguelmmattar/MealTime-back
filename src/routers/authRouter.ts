import express from "express";
import authorizations from "../middlewares/authorizations.js";
import authController from "../controllers/authController.js";
import scheemas from "../middlewares/scheemas.js";

const router = express.Router();

router.post("/sign-up", scheemas.newUserSchema, authorizations.allowSignUp, authController.signUp);
router.post("/sign-in",  scheemas.signInSchema, authorizations.allowSignIn, authController.signIn);
router.put("/sign-out", authorizations.authorize, authController.signOut);

export default router;