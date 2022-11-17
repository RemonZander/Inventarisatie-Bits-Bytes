// Use the MariaDB Node.js Connector
const fs = require("fs");
const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('database.db');

const sqlData = fs
    .readFileSync("database.db.sql", { flag: "r" })
    .toString()
    .trim()
    .split(";");

for (var a = 0; a < sqlData.length - 1; a++) {
    db.run(sqlData[a]);
}

module.exports = Object.freeze({
    db: db
});