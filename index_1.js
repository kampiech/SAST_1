const express = require('express');
const lodash = require("lodash"); // ver 4.17.16
const app = express();
const fs = require("fs");

app.get("/", (req, res) => {
    // Get q parameter
    const key = req.query.key;
    const value = req.query.value;
    lodash.set({}, key, value);
    res.setHeader("content-type", "text/plain; charset=utf-8");

    process.exit();
});
