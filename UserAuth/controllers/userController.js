const jwt = require('jsonwebtoken');
const {User} = require('../models');
const config = require('../config/config');
require("dotenv").config({ path: "../config.env" });

function jwtSignUser(user) {
    const ONE_WEEK = 7 * 24 * 60 * 60;
    return jwt.sign({id: user['email']}, config.JwtSecret, {
      expiresIn: ONE_WEEK
    })
  }

module.exports = {
    findById: (req, res) => {
        const {user} = req;
        if(!user){
            return res.status(400).send({error: "server issue try again later."})
        }
        return res.json(user)
    },

    async signup(req, res) {
        while(true) {
            try {
                const data = req.body
                const user = await User.create(data)
                const userObjJson = user.toJSON();
                return res.send({
                    user: userObjJson,
                    token: jwtSignUser(userObjJson)
                })
            } catch(error) {
                console.log(error);
                if (Object.keys(error.keyValue)[0] == 'email') {
                    return res.status(400).send({error: "This email is already in use"})
                } else if (Object.keys(error.keyValue)[0] == 'usertag_pair') {
                    const users = await User.find({username: req.body['username']})
                    if(users.length >= MAX_USERS_PER_NAME) {
                        return res.status(400).send({error: 'Try a different username'})
                    } else {
                        continue
                    }
                }

                return res.status(400).send({error: 'something is wrong'})
            }
        }
    },

    async login (req, res) {
        try{
            const {email, password} = req.body;
            const user = await User.findOne({email});
            if (!user) {
                return res.status(403).send({error: "User not found"})
            }
            const isPasswordValid = await user.verifyPassword(password);

            if(!isPasswordValid){
                return res.status(403).send({error: 'the login information is not correct'});
            }

            const userObjJson = user.toJSON();
            return res.send({
                user: userObjJson,
                token: jwtSignUser(userObjJson)
            })
        } catch (error) {
            console.log(error);
            return res.status(500).send({error: 'error has occurred, please try again'});
        }
    }
}