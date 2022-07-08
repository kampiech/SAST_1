const express = require('express');
const app = express();

const UNSAFE_KEYS = ["__proto__", "constructor", "prototype"];

const merge = (obj1, obj2) => {
    for (let key of Object.keys(obj2)) {
        if (UNSAFE_KEYS.includes(key)) continue;
        const val = obj2[key];
        key = key.trim();
        if (typeof obj1[key] !== "undefined" && typeof val === "object") {
            obj1[key] = merge(obj1[key], val);
        } else {
            obj1[key] = val;
        }
    }

    return obj1;
};

const defaults = {};


app.get("/", (req, res) => {
    // Get q parameter
    const query = req.query.query ?? "{}";
    const queryObject = JSON.parse(query);

    const options = {};
    merge(options, defaults);
    merge(options, queryObject);
    res.setHeader("content-type", "text/plain; charset=utf-8");

    process.exit();
});

