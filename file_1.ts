module.exports.index = async function (req, res) {
    const value = req.query.value;

    res.setHeader("Set-Cookie", value);  // Noncompliant
    res.cookie("connect.sid", value);  // Noncompliant
};

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