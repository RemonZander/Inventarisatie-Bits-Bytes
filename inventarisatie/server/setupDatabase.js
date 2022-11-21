const db = require('./db')
const fs = require("fs");

const sqlData = fs
    .readFileSync("database.db.sql", { flag: "r" })
    .toString()
    .trim()
    .split(";");

for (var a = 0; a < sqlData.length - 1; a++) {
    console.log(sqlData[a]);
    db.db.run(sqlData[a]);
}