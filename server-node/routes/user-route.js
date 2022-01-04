const express = require('express');
const router = express.Router();
const User = require('./../models/user');
const response = require('./../response');

router.get('/users', (req, res) => {
    User.findAll().then((users) => {
        res.send('users list...');
    })
})

//login
router.post('/user/login', (req, res) => {
    const user = req.body;
    User.findOne({
        where: {employeeId: user.employeeId}
    }).then((foundUser) => {
        if (foundUser.password === user.password) {
            response.response({
                res: res,
                data: foundUser,
                status: response.SUCCESS,
                message: 'some message'
            });
        } else {
            response.response({
                res: res,
                data: null,
                status: response.FAILED,
                message: 'user not found'
            })
        }
    })
})

//create user
router.post('/user/signup', (req, res) => {
    const user = req.body;
    User.create({
        employeeId: user.employeeId,
        password: user.password,
        createdByUserId: 1,
        modifiedByUserId: 1,
        statusId: 1
    }).then(() => {
        console.log('user created successfully');
        response.response({
            res: res,
            data: null,
            status: response.SUCCESS,
            message: 'User created successfully'
        })
    }).catch((error) => {
        console.log('Error Creating User: ' + error);
        response.response({
            res: res,
            data: null,
            status: response.FAILED,
            message: error,
        })
    })
})

module.exports = router;
