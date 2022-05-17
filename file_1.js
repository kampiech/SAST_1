//Example of DOM open redirect vulnerability (http://vulnerable/page.html#https://www.attacker.com/):
document.location = document.location.hash.slice(1);

var mysql = require('mysql');

var connection = mysql.createConnection(
    {
        host: 'localhost',
        user: "admin",
        database: "project",
        password: "mypassword", // sensitive
        multipleStatements: true
    });

connection.connect();