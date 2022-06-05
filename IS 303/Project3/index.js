//Bring in express
const express = require('express');

//App constant that is the express object
const app = express()

//Other setup vairables
const port = 3000;
const path = require('path');

//Bring in Knex
const knex = require('knex') ({
    client: 'sqlite3',
    connection: {
        filename: "./MusicLibrary.db"
    },
    useNullAsDefault: true,
});

//Bring in body parser
const bodyParser = require('body-parser');

//Allows to use objects and arrays like JSON format
app.use(bodyParser.urlencoded({extended: true}));

//Use EJS as view engine
app.set('view engine', 'ejs');

//Main route when user visits main page, automatically sorts by Song ID
app.get('/', (req, res) => {
    let focus= 'songIDFocus';

    knex.select('SongID', 'SongName', 'ArtistID', 'YearReleased').from('Songs').orderBy('SongID').then(song => {
        res.render('index', {songs: song, whereToFocus: focus});
    }).catch(err => {
        console.log(err);
        res.status(500).json({err});
    });
});

//Sort the list by song name
app.get('/sortBySong', (req,res) => {
    let focus = 'songFocus';

    knex.select('SongID', 'SongName', 'ArtistID', 'YearReleased').from('Songs').orderBy('SongName').then(song => {
        res.render('index', {songs: song, whereToFocus: focus});
    }).catch(err => {
        console.log(err);
        res.status(500).json({err});
    });
});

//Sort the list by artist name
app.get('/sortByArtist', (req,res) => {
    let focus = 'artistFocus';

    knex.select('SongID', 'SongName', 'ArtistID', 'YearReleased').from('Songs').orderBy('ArtistID').then(song => {
        res.render('index', {songs: song, whereToFocus: focus});
    }).catch(err => {
        console.log(err);
        res.status(500).json({err});
    });
});

//Sort the list by year
app.get('/sortByYear', (req,res) => {
    let focus = 'yearFocus';
    
    knex.select('SongID', 'SongName', 'ArtistID', 'YearReleased').from('Songs').orderBy('YearReleased').then(song => {
        res.render('index', {songs: song, whereToFocus: focus});
    }).catch(err => {
        console.log(err);
        res.status(500).json({err});
    });
});

//Delete the song
app.post('/DeleteSong/:ID', (req, res) => {
    knex('Songs').where('SongID', req.params.ID).del().then(() =>{
        res.redirect('/');
    }).catch(err => {
        console.log(err);
        res.status(500).json({err});
    });
});

//Resets the database
app.post('/ResetDatabase/', (req, res) => {
    //Set the default songs
    let defaultSongs = [{SongName: 'Bohemian Rhapsody', ArtistID: 'QUEEN', YearReleased: "1975"}, 
    {SongName: 'Don\'t Stop Believing', ArtistID: 'JOURNEY', YearReleased: "1981"}, 
    {SongName: 'Hey Jude', ArtistID: 'BEATLES', YearReleased: "1968"}];

    //First delete all the records
    knex('Songs').del().then(() => {
        //Inserts the default songs into the database
        knex.insert(defaultSongs).into('Songs').then(() => {
            res.redirect('/');
        }).catch(err => {
            console.log(err);
            res.status(500).json({err});
        });
    }).catch(err => {
        console.log(err);
        res.status(500).json({err});
    });
});

//Adds a new song
app.post('/addSong', (req, res) => {
    let newSongName = req.body.songName;
    let newArtistID = req.body.artistID;
    let newYearReleased = req.body.yearReleased;

    knex('Songs').insert(req.body).then(() => {
        res.redirect('/');
    }).catch(err => {
        console.log(err);
        res.status(500).json({err});
    });
});

//Takes user to the add song ejs file
app.get('/addSong', (req,res) => {
    res.render('addSong');
});

//Take user to the edit song ejs file and passes the song data
app.get('/editSong/:ID/:Name/:Artist/:Year', (req, res) => {
    console.log(req.params.ID);
    res.render('editSong', {
        ID: req.params.ID,
        Name: req.params.Name,
        Artist: req.params.Artist,
        Year: req.params.Year
        });
});

//Changes the song data, based on the Song ID
app.post('/editSong/:ID', (req, res) => {
    knex('Songs').where('SongID', req.params.ID).update({
        SongName: req.body.songName,
        ArtistID: req.body.artistID,
        YearReleased: req.body.yearReleased
    }).then(() => {
        res.redirect('/');
    });
})

//Start up the server
app.listen(port, () => console.log(`Project listening on port ${port}`));