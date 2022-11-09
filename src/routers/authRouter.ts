import express from "express";
import authorizations from "../middlewares/authorizations.js";
import authController from "../controllers/authController.js";

const router = express.Router();

router.post("/sign-up", authorizations.allowSignUp, authController.signUp);
router.post("/sign-in", authorizations.allowSignIn, authController.signIn);
router.put("/sign-out", authorizations.authorize, authController.signOut);

export default router;