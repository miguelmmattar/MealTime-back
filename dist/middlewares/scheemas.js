import Joi from "joi";
import { joiPasswordExtendCore } from "joi-password";
import { STATUS_CODE } from "../enums/statusCode.js";
var JoiPassword = Joi.extend(joiPasswordExtendCore);
function newUserSchema(req, res, next) {
    var newUser = req.body;
    var schema = Joi.object({
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
    var validation = schema.validate(newUser, { abortEarly: false });
    if (validation.error) {
        var errors = validation.error.details.map(function (detail) { return detail.message; });
        return res.status(STATUS_CODE.UNPROCESSABLE_ENTITY).send(errors);
    }
    res.locals.newUser = newUser;
    next();
}
function signInSchema(req, res, next) {
    var user = req.body;
    var schema = Joi.object({
        email: Joi.string().min(1).email().required(),
        password: JoiPassword.string().noWhiteSpaces().required()
    });
    var validation = schema.validate(user, { abortEarly: false });
    if (validation.error) {
        var errors = validation.error.details.map(function (detail) { return detail.message; });
        return res.status(STATUS_CODE.UNPROCESSABLE_ENTITY).send(errors);
    }
    res.locals.user = user;
    next();
}
function newRecipeSchema(req, res, next) {
    var newRecipe = req.body;
    var schema = Joi.object({
        name: Joi.string().min(1).max(50).required(),
        serves: Joi.number().min(1).required(),
        prepTime: Joi.number().min(1).required(),
        method: Joi.string().min(1).required(),
        image: Joi.string(),
        category: Joi.array().items(Joi.object({
            id: Joi.number().required(),
            name: Joi.string().min(1).required()
        }).required()),
        ingredients: Joi.array().items(Joi.object({
            name: Joi.string().min(1).required(),
            quantity: Joi.string().allow(null, '')
        })).required(),
        by: Joi.object({
            id: Joi.number().min(1).required(),
            name: Joi.string().min(1).max(50).required()
        }).required()
    });
    var validation = schema.validate(newRecipe, { abortEarly: false });
    if (validation.error) {
        var errors = validation.error.details.map(function (detail) { return detail.message; });
        return res.status(STATUS_CODE.UNPROCESSABLE_ENTITY).send(errors);
    }
    res.locals.newRecipe = newRecipe;
    next();
}
export default {
    newUserSchema: newUserSchema,
    signInSchema: signInSchema,
    newRecipeSchema: newRecipeSchema
};
