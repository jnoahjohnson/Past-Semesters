const express = require('express');
var knex = require('knex')({
    client: 'sqlite3',
    connection: {
      filename: "./Registration.db"
    }
  });
const bodyParser = require('body-parser');
const app = express();
const port = 3000;
const path = require('path');

//Index file
app.get('/', (req, res) => {
    console.log(__dirname);
    res.sendFile(path.join(__dirname + '/index.html'));
});

app.get('/about', (req, res) => {
    console.log("Went to the about page");
    res.send("About us");
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));