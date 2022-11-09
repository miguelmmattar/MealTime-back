import Joi, { string } from "joi";
import { joiPasswordExtendCore } from "joi-password";
import { Request, Response, NextFunction } from "express";
import { NewUser } from "../protocols/NewUser.js";
import { SignIn } from "../protocols/SignIn.js";
import { STATUS_CODE } from "../enums/statusCode.js";

const JoiPassword = Joi.extend(joiPasswordExtendCore);

function newUserSchema(req: Request, res: Response, next: NextFunction) {
    const newUser = req.body as NewUser;
    const schema = Joi.object({
        name: Joi.string().min(1).max(15).required(),
        email: Joi.string().min(1).email().required(),
        password: JoiPassword.string()
        .min(6)
        .max(10)
        .minOfSpecialCharacters(1)
        .minOfLowercase(1)
        .minOfUppercase(1)
        .minOfNumeric(1)
        .noWhiteSpaces()
        .required(),
        confirmPassword: Joi.valid(Joi.ref('password'))
    });

    const validation = schema.validate(newUser, { abortEarly: false });

    if (validation.error) {
        const errors = validation.error.details.map((detail) => detail.message);
        return res.status(STATUS_CODE.UNPROCESSABLE_ENTITY).send(errors);
    }

    res.locals.newUser = newUser;
    
    next();
}


function signInSchema(req: Request, res: Response, next: NextFunction) {
    const user = req.body as SignIn;
    const schema = Joi.object({
        email: Joi.string().min(1).email().required(),
        password: JoiPassword.string().noWhiteSpaces().required(),
    });

    const validation = schema.validate(user, { abortEarly: false });

    if (validation.error) {
        const errors = validation.error.details.map((detail) => detail.message);
        return res.status(STATUS_CODE.UNPROCESSABLE_ENTITY).send(errors);
    }

    res.locals.newUser = user;
    
    next();
}

export default {
    newUserSchema,
    signInSchema
};