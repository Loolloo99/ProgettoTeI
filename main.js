const express = require('express');
const app = express();
const path = require('path');
const mariadb = require('mariadb');
const fs = require('fs')
const dotenv = require('dotenv').config();
const cookieParser = require('cookie-parser');
const https = require('https');


//set configurations

app.use(express.urlencoded({extended : false}));
app.use(express.json());
app.use(cookieParser());
app.use('/', require('./routes/pages'));
app.use('/auth',require('./routes/auth'))
app.set('view engine', 'ejs');

var options = {
    key: fs.readFileSync('./key.pem'),
    cert: fs.readFileSync('./cert.pem')
  };

console.log("connecting to database "+process.env.database+" at "+process.env.host+" with user "+process.env.user)

app.listen(3000, () => console.log("Listening..."));
https.createServer(options, app).listen(8000);
