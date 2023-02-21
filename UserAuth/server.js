const express = require("express");
const morgan = require("morgan");
const helmet = require("helmet");
const cors = require("cors");
const mongoose = require("mongoose");
const multer = require('multer')
const forms = multer()

require("dotenv").config({ path: "./config.env" });
const db = process.env.ATLAS_URI;
const app = express();
const api = require('./routes')
const {isAuthenticated} = require('./middlewares');

app.use(cors());

require('./services/passport')

app.use(morgan('dev'));
app.use(express.urlencoded({extended: true}));

app.use(express.json());
app.use(helmet());

mongoose.connect(db, {
}).then(() => {
  console.log('Succefuly connected to db')
}).catch((err) => {
  console.log('err :>> ', err);
})

app.use('/api/v1', api);
app.use(isAuthenticated);
module.exports = app;