const express = require('express')
const app = express()
const port = 3000;
const bodyParser = require('body-parser');
const response = require('./response');
const userRouter = require('./routes/user-route');


const sequelize = require('./util/database')


sequelize.sync().then(() => {
    console.log('sequelize is syncing...')
})

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader(
        "Access-Control-Allow-Headers",
        "Origin, X-Requested-With, Content-Type, Accept"
    );
    res.setHeader(
        "Access-Control-Allow-Methods",
        "GET, POST, PATCH, PUT, DELETE, OPTIONS"
    );
    next(); //without this like, the execute with stop
});

app.get('/', (req, res, next) => {
    // res.send('Hello World!')
    response.response({
        res: res,
        data: 'Hello World!!!',
        message: 'response successful...',
        status: 'Success'
    })
});

app.use(userRouter)
// app.get('/', (req, res) => {
//     res.json('Hello World!');
// })

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
})
