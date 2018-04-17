var express = require('express');
var path = require('path');
var bodyParser = require('body-parser');
var session = require('express-session');
var index = require('./mean/routes/index');
var app = express();

//Database setup
var mongo = require('mongodb');
var monk = require('monk');
var db = monk('localhost:27017/project');
app.use(function(req, res, next) {
    req.db = db;
    next();
});

//View engine setup
app.set('views', path.join(__dirname, 'mean', 'views'));
app.set('view engine', 'jade');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true })); 
app.use(express.static(path.join(__dirname, 'public')));
app.use(session( {secret: "String for encrypting cookies." } ));

app.use('/', index);

module.exports = app;
app.listen(3000);