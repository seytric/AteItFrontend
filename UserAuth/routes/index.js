const express = require('express');
const user = require('./userRoutes');

const router = express.Router();

router.use('/user', user)

module.exports = router;