// backend/utils/db.config.js
const mysql = require('mysql2/promise');

const createDatabaseConnection = (host, user, password, database) => {
    return mysql.createPool({
        host,
        user,
        password,
        database,
        waitForConnections: true,
        connectionLimit: 10,
        queueLimit: 0
    });
};

const pool = createDatabaseConnection(
    process.env.DB_HOST,
    process.env.DB_USER,
    process.env.DB_PASSWORD,
    process.env.DB_NAME
);

module.exports = pool;
