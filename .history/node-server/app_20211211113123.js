const express = require('express');
const bodyParser = require("express");
const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false}))

app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader(
        "Access-Control-Allow-Headers",
        "Origin, X-Requested-With, Content-Type, Accept, Authorization"
    );
    res.setHeader(
        "Access-Control-Allow-Methods",
        "GET, POST, PATCH, PUT, DELETE, OPTIONS"
    );
    next(); //without this like, the execute with stop
});

app.get('/', (req, res, next) => {
    // res.send('Namah Shivaya');
    res.json({message: 'Namahe Shivaya'});
});


app.listen(port, () => {
    console.log('server listing on port: ' + port);
});

