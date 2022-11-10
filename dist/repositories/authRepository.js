import connection from "../database/Postgres.js";
import bcrypt from "bcrypt";
function getUser(info, type) {
    var filter;
    if (type === "email") {
        filter = "WHERE email = $1";
    }
    else {
        filter = "WHERE userId = $1";
    }
    return connection.query("\n    SELECT\n        id,\n        name, \n        email,\n        \"password\" \n    FROM users \n        ".concat(filter, ";\n"), [info]);
}
function getSession(info, type) {
    var filter;
    if (type === "email") {
        filter = "WHERE email = $1";
    }
    else {
        filter = "WHERE token = $1";
    }
    return connection.query("\n    SELECT \n        * \n    FROM sessions\n    JOIN users ON sessions.\"userId\" = users.id \n        ".concat(filter, "\n    ORDER BY sessions.id DESC;\n"), [info]);
}
function postNewUser(name, email, password) {
    return connection.query("\n        INSERT INTO \n            users (name, email, password)\n        VALUES ($1, $2, $3);\n    ", [name, email, bcrypt.hashSync(password, 10)]);
}
function postNewSession(session) {
    return connection.query("\n        INSERT INTO\n            sessions (\"userId\", token)\n        VALUES ($1, $2);\n    ", [session.userId, session.token]);
}
function closeSession(token) {
    return connection.query("\n        UPDATE \n            sessions\n        SET \"closedAt\" = NOW()\n        WHERE token = $1;\n    ", [token]);
}
export default {
    getUser: getUser,
    getSession: getSession,
    postNewUser: postNewUser,
    postNewSession: postNewSession,
    closeSession: closeSession
};
