import connection from "../database/Postgres.js";
import bcrypt from "bcrypt";
import { Session } from "../protocols/session.js";

function getUser(info: string | number, type: string) {
    let filter: string;
    
    if(type === "email") {
        filter = "WHERE email = $1";
    } else {
        filter = "WHERE userId = $1";
    }

    return connection.query(`
    SELECT
        id,
        name, 
        email,
        "password" 
    FROM users 
        ${filter};
`, [info]);
}

function getSession(info: string, type: string) {
    let filter: string;
    
    if(type === "email") {
        filter = "WHERE email = $1";
    } else {
        filter = "WHERE token = $1";
    }
    
    return connection.query(`
    SELECT 
        * 
    FROM sessions
    JOIN users ON sessions."userId" = users.id 
        ${filter}
    ORDER BY sessions.id DESC;
`, [info]);
}

function postNewUser(name: string, email: string, password: string) {
    return connection.query(`
        INSERT INTO 
            users (name, email, password)
        VALUES ($1, $2, $3);
    `, [name, email, bcrypt.hashSync(password, 10)]);
}

function postNewSession(session: Session) {
    return connection.query(`
        INSERT INTO
            sessions ("userId", token)
        VALUES ($1, $2);
    `, [session.userId, session.token]);
}

function closeSession(token: string) {
    return connection.query(`
        UPDATE 
            sessions
        SET "closedAt" = NOW()
        WHERE token = $1;
    `, [token]);
}

export default {
    getUser,
    getSession,
    postNewUser,
    postNewSession,
    closeSession
}