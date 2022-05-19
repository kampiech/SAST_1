var myarray = [80, 3, 9, 34, 23, 5, 1];

myarray.sort();
console.log(myarray); // outputs: [1, 23, 3, 34, 5, 80, 9]

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