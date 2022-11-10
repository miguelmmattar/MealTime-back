import { Request, Response } from "express";
import { NewUser } from "../protocols/User.js";
import { Session } from "../protocols/session.js";
import authRepository from "../repositories/authRepository.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import dotenv from "dotenv";
import jwt from "jsonwebtoken";

dotenv.config();

async function signUp(req: Request, res: Response) {
    const { name, email, password } = res.locals.newUser as NewUser;

    try {
        await authRepository.postNewUser(name, email, password);

        res.sendStatus(STATUS_CODE.OK);
    } catch(error) {
        console.log(error.message);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }
}

async function signIn(req: Request, res: Response) {
    let session = res.locals.newSession as Session;
    const token = jwt.sign({ userId: session.userId }, process.env.TOKEN_SECRET);

    session.token = token;

    try {
        await authRepository.postNewSession(session);

        res.status(STATUS_CODE.OK).send(session);
    } catch(error) {
        console.log(error.message);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }
}

async function signOut(req: Request, res: Response) {
    const session = res.locals.session as Session;

    try {
        await authRepository.closeSession(session.token);

    } catch(error) {
        console.log(error.message);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    res.sendStatus(STATUS_CODE.OK);
}

export default {
    signUp,
    signIn,
    signOut
}
