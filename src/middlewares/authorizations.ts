import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import dotenv from "dotenv";
import { Request, Response, NextFunction } from "express";
import { NewUser } from "../protocols/NewUser.js";
import { SignIn } from "../protocols/SignIn.js";
import { Session } from "../protocols/session.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import authRepository from "../repositories/authRepository.js";

dotenv.config();

async function allowSignUp(req: Request, res: Response, next: NextFunction) {
    const newUser = req.body as NewUser;

    try {
        const user = await authRepository.getEmail(newUser.email);
        if(user.rows[0]) {
            return res.sendStatus(STATUS_CODE.CONFLICT);     
       }
       res.locals.newUser = newUser;
    } catch(error) {
        console.log(error.message);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }
    
    next();
}

async function allowSignIn(req: Request, res: Response, next: NextFunction) {
    const { email, password } = req.body as SignIn;

    try {
        const user = await authRepository.getUser(email);
        
        if(!user.rows[0]) {
            return res.sendStatus(STATUS_CODE.UNAUTHORIZED);
        }

        const hash: string = user.rows[0].password;

        if(!bcrypt.compareSync(password, hash)) {
            return res.sendStatus(STATUS_CODE.UNAUTHORIZED);
        }

        const session = await authRepository.getSession(email, "email");

        if(session.rows[0]) { 
            if(session.rows[0].closedAt === null) { 
                return res.sendStatus(STATUS_CODE.UNAUTHORIZED);
            }
        } 

        res.locals.newSession = {
            userId: user.rows[0].id,
            token: ""
        } as Session;
    
    } catch(error) {
        console.log(error.message);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    next();
}

async function authorize(req: Request, res: Response, next: NextFunction) {
    const { authorization } = req.headers;
    const token = authorization?.replace('Bearer ', '');
    
    try {
        if(!token) {
            return res.sendStatus(STATUS_CODE.UNAUTHORIZED);
        }

        const session = await authRepository.getSession(token, "token");

        if(!session.rows[0] || session.rows[0].closedAt) {
            return res.sendStatus(STATUS_CODE.UNAUTHORIZED);
        }

        try {
            jwt.verify(token, process.env.TOKEN_SECRET).userId;
        } catch(error) {
            console.log(error.message);
            return res.sendStatus(STATUS_CODE.UNAUTHORIZED);
        }
        
        res.locals.session = session.rows[0];
    } catch(error) {
        console.log(error.message);
        return res.sendStatus(STATUS_CODE.SERVER_ERROR);
    }

    next();
}

export default {
    allowSignUp,
    allowSignIn,
    authorize
}