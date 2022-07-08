const express = require('express');
const lodash = require("lodash"); // ver 4.17.16
const app = express();

const FLAG = process.env.FLAG;

app.get("/", (req, res) => {
    // Get q parameter
    const key = req.query.key ?? "";
    const value = req.query.value ?? "";
    if (key.includes("__proto__")) {
        res.send("Prototype pollution detected!");
        process.exit();
        return;
    }
    lodash.set({}, key, value);
    res.setHeader("content-type", "text/plain; charset=utf-8");

    process.exit();
});
