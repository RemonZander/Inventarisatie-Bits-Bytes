// Use the MariaDB Node.js Connector
var mariadb = require('mariadb');

// Create a connection pool
var pool =
    mariadb.createPool({
        host: "10.10.10.200",
        port: 3306,
        user: "remon",
        password: "Banjocraft1",
        database: "inventarisatie"
    });

// Expose a method to establish connection with MariaDB SkySQL
module.exports = Object.freeze({
    pool: pool
});