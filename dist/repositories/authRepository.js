import connection from "../database/Postgres.js";
import bcrypt from "bcrypt";
function getEmail(email) {
    return connection.query("\n    SELECT\n        id,\n        name, \n        email,\n        \"passwordHash\" \n    FROM users \n        WHERE email = $1;\n", [email]);
}
function getUser(email) {
    return connection.query("\n    SELECT\n        id,\n        name, \n        email,\n        \"passwordHash\" \n    FROM users \n        WHERE email = $1;\n", [email]);
}
function getSession(info, type) {
    return connection.query("\n    SELECT \n        * \n    FROM sessions \n        WHERE $1 = $2;\n", [type, info]);
}
function postNewUser(name, email, password) {
    return connection.query("\n        INSERT INTO \n            users (name, email, password)\n        VALUES ($1, $2, $3);\n    ", [name, email, bcrypt.hashSync(password, 10)]);
}
function postNewSession(session) {
    return connection.query("\n        INSERT INTO\n            sessions (\"userId\", token)\n        VALUES ($1, $2);\n    ", [session.userId, session.token]);
}
export default {
    getEmail: getEmail,
    getUser: getUser,
    getSession: getSession,
    postNewUser: postNewUser,
    postNewSession: postNewSession
};
