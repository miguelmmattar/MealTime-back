var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import dotenv from "dotenv";
import { STATUS_CODE } from "../enums/statusCode.js";
import authRepository from "../repositories/authRepository.js";
import recipesRepository from "../repositories/recipesRepository.js";
dotenv.config();
function allowSignUp(req, res, next) {
    return __awaiter(this, void 0, void 0, function () {
        var newUser, user, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    newUser = res.locals.newUser;
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 3, , 4]);
                    return [4 /*yield*/, authRepository.getUser(newUser.email, "email")];
                case 2:
                    user = _a.sent();
                    if (user.rows[0]) {
                        return [2 /*return*/, res.sendStatus(STATUS_CODE.CONFLICT)];
                    }
                    res.locals.newUser = newUser;
                    return [3 /*break*/, 4];
                case 3:
                    error_1 = _a.sent();
                    console.log(error_1.message);
                    return [2 /*return*/, res.sendStatus(STATUS_CODE.SERVER_ERROR)];
                case 4:
                    next();
                    return [2 /*return*/];
            }
        });
    });
}
function allowSignIn(req, res, next) {
    return __awaiter(this, void 0, void 0, function () {
        var _a, email, password, user, hash, session, error_2;
        return __generator(this, function (_b) {
            switch (_b.label) {
                case 0:
                    _a = res.locals.user, email = _a.email, password = _a.password;
                    _b.label = 1;
                case 1:
                    _b.trys.push([1, 4, , 5]);
                    return [4 /*yield*/, authRepository.getUser(email, "email")];
                case 2:
                    user = _b.sent();
                    if (!user.rows[0]) {
                        return [2 /*return*/, res.sendStatus(STATUS_CODE.UNAUTHORIZED)];
                    }
                    hash = user.rows[0].password;
                    if (!bcrypt.compareSync(password, hash)) {
                        return [2 /*return*/, res.sendStatus(STATUS_CODE.UNAUTHORIZED)];
                    }
                    return [4 /*yield*/, authRepository.getSession(email, "email")];
                case 3:
                    session = _b.sent();
                    if (session.rows[0]) {
                        if (session.rows[0].closedAt === null) {
                            return [2 /*return*/, res.sendStatus(STATUS_CODE.UNAUTHORIZED)];
                        }
                    }
                    res.locals.newSession = {
                        userId: user.rows[0].id,
                        token: ""
                    };
                    return [3 /*break*/, 5];
                case 4:
                    error_2 = _b.sent();
                    console.log(error_2.message);
                    return [2 /*return*/, res.sendStatus(STATUS_CODE.SERVER_ERROR)];
                case 5:
                    next();
                    return [2 /*return*/];
            }
        });
    });
}
function authorize(req, res, next) {
    return __awaiter(this, void 0, void 0, function () {
        var authorization, token, session, error_3;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    authorization = req.headers.authorization;
                    token = authorization === null || authorization === void 0 ? void 0 : authorization.replace('Bearer ', '');
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 3, , 4]);
                    if (!token) {
                        return [2 /*return*/, res.sendStatus(STATUS_CODE.UNAUTHORIZED)];
                    }
                    return [4 /*yield*/, authRepository.getSession(token, "token")];
                case 2:
                    session = _a.sent();
                    if (!session.rows[0]) {
                        return [2 /*return*/, res.sendStatus(STATUS_CODE.UNAUTHORIZED)];
                    }
                    if (session.rows[0].closedAt) {
                        return [2 /*return*/, res.sendStatus(STATUS_CODE.UNAUTHORIZED)];
                    }
                    try {
                        jwt.verify(token, process.env.TOKEN_SECRET);
                    }
                    catch (error) {
                        console.log(error.message);
                        return [2 /*return*/, res.sendStatus(STATUS_CODE.UNAUTHORIZED)];
                    }
                    res.locals.session = session.rows[0];
                    return [3 /*break*/, 4];
                case 3:
                    error_3 = _a.sent();
                    console.log(error_3.message);
                    return [2 /*return*/, res.sendStatus(STATUS_CODE.SERVER_ERROR)];
                case 4:
                    next();
                    return [2 /*return*/];
            }
        });
    });
}
function allowDelete(req, res, next) {
    return __awaiter(this, void 0, void 0, function () {
        var userId, recipeId, recipeOwner, error_4;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    userId = Number(res.locals.session.userId);
                    recipeId = Number(req.params.recipeId);
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 3, , 4]);
                    return [4 /*yield*/, recipesRepository.getRecipeOwner(recipeId)];
                case 2:
                    recipeOwner = _a.sent();
                    if (!recipeOwner.rows[0]) {
                        return [2 /*return*/, res.sendStatus(STATUS_CODE.NOT_FOUND)];
                    }
                    if (userId !== recipeOwner.rows[0].id) {
                        return [2 /*return*/, res.sendStatus(STATUS_CODE.UNAUTHORIZED)];
                    }
                    return [3 /*break*/, 4];
                case 3:
                    error_4 = _a.sent();
                    console.log(error_4.message);
                    return [2 /*return*/, res.sendStatus(STATUS_CODE.SERVER_ERROR)];
                case 4:
                    next();
                    return [2 /*return*/];
            }
        });
    });
}
export default {
    allowSignUp: allowSignUp,
    allowSignIn: allowSignIn,
    authorize: authorize,
    allowDelete: allowDelete
};
