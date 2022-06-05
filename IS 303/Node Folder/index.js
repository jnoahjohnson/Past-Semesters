const express = require('express')
const app = express()
const port = 3000
const path = require("path");

const bodyParser = require('body-parser');

const knex = require("knex") ({
  client: 'sqlite3',
  connection: {
    filename: "./database.db"
  },
  useNullAsDefault: true,
});

//Allows to use objects and arrays like JSON format
app.use(bodyParser.urlencoded({extended: true}));

//Use EJS as a view engine
app.set("view engine", "ejs");

app.get('/', (req,res) => {
  knex.select('NameID', 'FirstName', 'LastName').from('Name').orderBy('NameID').then(student => {
    res.render('index', {test: student});
  }).catch(err => {
    console.log(err);
    res.status(500).json({err});
  }); 
});


app.get('/addPerson', (req,res) => {
  
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));


 
