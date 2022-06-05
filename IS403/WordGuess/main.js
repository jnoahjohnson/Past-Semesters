/*
  
Description: Main JavaScript for the WordGuess Game! This file cotains the logic in order for users to play
a game similar to hangman. There is a song title that users can guess the characters of or also just go for it
and guess what song it is. If they do that then they must be wizards of song trivia.

The contestants are tracked by their names and number of guesses that they make. Users can see a leaderboard of 
all those who have tried their luck at Word Guess


Author: Noah Johnson

*/

//Global Variables

// Songs
let asSongs = [
  "rocklobster",
  "peoplearepeople",
  "onceinalifetime",
  "sweetdreams",
  "missionaryman",
  "safetydance",
  "onlyalad",
  "whipit",
  "99redballoons",
];

let currentSong = "";

//Contestants
let aoContestants = [];

const asInitialCharacters = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
];

//Letters Array
let asAvailableLetters = [];

let asUsedLetters = [];

//Classes ----------------

/*
    Person Class - firstName, lastName, age
    Constructor that allows user to pass first and last name
*/

class Person {
  firstName;
  lastName;
  age;

  constructor(firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }
}

/*
    Contestant Class - Inherited from Person

    numberOfGamesPlayed, totalNumberOfGuesses, gamesPlayed (array of GamesPlayed objects)

    Constructor receives parent's attributes and initializes the above attributes

    Methods:
        showResults - Return message with the first and last name along with the number of guesses of any completed games
            - Only Completed Games!
            - Examples: Greg Anderson has made 235 guesses; Greg Anderson has not finished a game

        getFullName - concatenates the firstName and lastName
            - Use this for the showResults method
*/

class Contestant extends Person {
  numberOfGamesPlayed;
  totalNumberOfGuesses;
  gamesPlayed;

  constructor(...args) {
    super(...args);
    this.numberOfGamesPlayed = 0;
    this.totalNumberOfGuesses = 0;
    this.gamesPlayed = [];
  }

  updateTotalNumberOfGuesses() {
    let totalGuesses = 0;
    this.gamesPlayed.forEach((gamePlayed) => {
      totalGuesses += gamePlayed.guessCount;
    });
    this.totalNumberOfGuesses = totalGuesses;
  }

  showResults() {
    if (this.numberOfGamesPlayed === 0) {
      alert(`${this.getFullName()} has not finished a game`);
      return;
    }

    alert(
      `${this.getFullName()} has made ${this.getNumberOfGuesses()} guesses`
    );
  }

  getNumberOfGuesses() {
    let numGuesses = 0;
    this.gamesPlayed.forEach((gamePlayed) => {
      if (gamePlayed.finishedGame === true) {
        numGuesses += gamePlayed.guessCount;
      }
    });
    return numGuesses;
  }

  getFullName() {
    return `${this.firstName} ${this.lastName}`;
  }
}

/*
    GamesPlayed Class

    Attributes: guessCount(Int), finishedGame(boolean)

    Constructor:
        No Parameters, just set guessCount to 0 and finishedGame to false

*/

class GamesPlayed {
  guessCount;
  finishedGame;

  constructor() {
    this.guessCount = 0;
    this.finishedGame = false;
  }
}

//Buttons from HTML

/*
    Reset Button - resetMe()

    Clear out the localStorage, 
    Clear global array of contestants
    Reload the characters string ("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") 
    Reload the used characters string ("")
*/

function resetMe() {
  localStorage.clear();
  aoContestants = [];
  asAvailableLetters = [...asInitialCharacters];
  asUsedLetters = [];
  alert("Games Reset!");
}

/*
    Play Game Button - playGame()

    Alert - Get first name then the last name using prompt
    Create Contestant object

    Generate a random number and then get a song from asSongs

    Make sure you are showing the displayTitleName, titleNote, fsPlay, 
    fsAvailable, and fsUsed fieldset html objects in the html file. 
    
    The cursor should then be programmatically placed in the input text area called inputLetter.
*/

function playGame() {
  //Get first and last name
  let firstName = getName("first");
  if (firstName === null) {
    return;
  }
  let lastName = getName("last");
  if (lastName === null) {
    return;
  }

  //Create new contestant
  aoContestants.unshift(new Contestant(firstName, lastName));

  //Setup the game
  setupGame({ show: true });
  reloadLetterFields();

  //Intro animation and focus
  document.body.classList.add("flyThrough");
  document.getElementById("inputLetter").focus();
}

//Function to get the User Name

function getName(typeOfName) {
  let validName = false;
  let name = "";

  //While loop until the user enters a valid name
  while (validName === false) {
    name = prompt(`What is your ${typeOfName} name?`);
    if (name === "") {
      alert(`Please enter your ${typeOfName} name.`);
    } else if (/\d/.test(name)) {
      alert("Please do not include numbers in your name.");
    } else {
      validName = true;
    }
  }
  return name;
}

//Function to setup the game - Uses show variable to show or hide the game board

function setupGame({ show } = {}) {
  //Create a new game
  aoContestants[0].gamesPlayed.unshift(new GamesPlayed());

  //Get a random song
  let randomNum = Math.floor(Math.random() * 9);
  currentSong = asSongs[randomNum];

  //Setup the game board
  asUsedLetters = [];
  asAvailableLetters = [...asInitialCharacters];
  reloadLetterFields();
  setTitleName();

  // Make sure you are showing the displayTitleName, titleNote, fsPlay,
  // fsAvailable, and fsUsed fieldset html objects in the html file.
  document.getElementById("displayTitleName").hidden = !show;
  document.getElementById("titleNote").hidden = !show;
  document.getElementById("fsPlay").hidden = !show;
  document.getElementById("fsUsed").hidden = !show;
  document.getElementById("fsAvailable").hidden = !show;
  document.getElementById("startDiv").hidden = show;
  if (show === true) {
    document.getElementById("gameDiv").classList.remove("hidden");
    document.getElementById("gameDiv").classList.add("appear");
  } else {
    document.getElementById("gameDiv").classList.add("hidden");
    document.getElementById("gameDiv").classList.remove("appear");
  }

  document.getElementById("playAgainDiv").classList.add("hidden");
}

//Sets the song title name with either a blank character or an underline

function setTitleName() {
  let titleField = document.getElementById("displayTitleName");
  let titleString = "";

  //For each song character, either add the character or an underline based on the used characters
  currentSong.split("").forEach((letter) => {
    if (asUsedLetters.indexOf(letter.toUpperCase()) >= 0) {
      titleString += letter.toUpperCase();
    } else {
      titleString += "_";
    }
    titleString += " ";
  });

  //Set the HTML for the song title
  titleField.innerHTML = titleString;
}

/* 
    Guess Button - guessLetter()

    Check if the letter has been used
    Check if the letter is in the title name (case does not matter!)

    Display characters as uppercase

    Remove from one array and add it to the other array
*/

function guessLetter() {
  let inputField = document.getElementById("inputLetter");
  let chosenLetter = inputField.value.toString().toUpperCase();

  //Check if there is more than one character
  if (chosenLetter.split("").length > 1) {
    alert("Please enter one character");
    return;
  }

  //Check is the character has been used
  if (asUsedLetters.indexOf(chosenLetter) >= 0) {
    inputField.value = "";
    alert("You have already used this letter!");
    return;
  }

  //Add 1 to guessCount for the current game and update total number of guesses
  aoContestants[0].gamesPlayed[0].guessCount += 1;
  aoContestants[0].updateTotalNumberOfGuesses();

  let foundIndex = asAvailableLetters.indexOf(chosenLetter);

  //If the character is in the song title
  if (foundIndex >= 0) {
    //Update the used and available characters
    asUsedLetters.push(chosenLetter);
    asAvailableLetters.splice(foundIndex, 1);

    //Reset input field
    inputField.value = "";

    //Set the title and see if the user won
    setTitleName();
    reloadLetterFields();
    checkWin();

    //Focus on th einput field
    inputField.focus();
  }

  //Check to see if user has guessed 26 times
  if (aoContestants[0].gamesPlayed[0].guessCount >= 26) {
    userLost();
  }
}

//Function for the final guess
function finalGuess() {
  //Get the final guess
  let finalGuess = document.getElementById("finalGuess").value;

  if (finalGuess.toLowerCase() === currentSong) {
    //Add 1 to guessCount for the current game
    aoContestants[0].gamesPlayed[0].guessCount += 1;
    aoContestants[0].updateTotalNumberOfGuesses();
    saveContestants();
    userWon();
  } else {
    //Add 1 to guessCount for the current game
    aoContestants[0].gamesPlayed[0].guessCount += 26;
    aoContestants[0].updateTotalNumberOfGuesses();
    saveContestants();
    userLost();
  }

  //Reset the final guess field
  document.getElementById("finalGuess").value = "";
}

//Helper Functions

//Updates the available and used letter fields
function reloadLetterFields() {
  document.getElementById("usedChars").innerHTML = asUsedLetters
    .join("")
    .bold();
  document.getElementById("availableChars").innerHTML = asAvailableLetters
    .join("")
    .bold();
}

/*
    Check Win Function - 
    
    If all letters are displayed and guess count is less than 26, show the message 
        - "You Solved it with # of guesses!" (where # is the number of guesses it took)

    Else: 
        - "You took too many guesses"

    If a win:
        - Update Contestant and GamesPlayed
            - Update totalNumberOfGuesses, finishedGame, numberOfGamesPlayed
        - Clear input and reset display for the available and used characters
        Play again with Same user and play again with different user button
*/

function checkWin() {
  //Save contestants to local storage
  saveContestants();

  //Check to see if user won
  if (
    document
      .getElementById("displayTitleName")
      .innerHTML.split("")
      .indexOf("_") === -1
  ) {
    userWon();
  }
}

//Functions of what to do when the user wins or loses

function userWon() {
  //Set current game to finished
  aoContestants[0].gamesPlayed[0].finishedGame = true;

  //Set the congrats header
  document.getElementById(
    "congratsHeader"
  ).innerHTML = `Congratulations ${aoContestants[0].firstName}, you solved it with ${aoContestants[0].gamesPlayed[0].guessCount} guesses!`;

  //Show the play agin buttons
  document.getElementById("playAgainDiv").classList.toggle("hidden");
}

function userLost() {
  //Set current game to finished
  aoContestants[0].gamesPlayed[0].finishedGame = true;

  //Set the congrats header
  document.getElementById(
    "congratsHeader"
  ).innerHTML = `Sorry ${aoContestants[0].firstName}, you took too many guesses.`;

  //Show the play agin buttons
  document.getElementById("playAgainDiv").classList.toggle("hidden");
}

/*
    Play Again Funtion - playAgain()

    Play with the same user
*/

function playAgain() {
  //Setup the new game
  setupGame({ show: true });
}

/*
    Show Games - showGames()

    Descending order by totalNumberOfGuesses - Store to local storage
    Open a new window called gameOutput.html
    Show the sorted data
*/

function showGames() {
  //Sort the agames
  let sortedContestants = aoContestants.sort(
    (firstContestant, secondContestant) =>
      firstContestant.totalNumberOfGuesses <
      secondContestant.totalNumberOfGuesses
        ? 1
        : -1
  );

  //Save the data to local storage and go to the games.html page
  let dataToSave = JSON.stringify(sortedContestants);
  localStorage.setItem("sortedContestants", dataToSave);
  window.location.href = "games.html";
}

//Save the contestants to local storage so the data is saved when page is refreshed
function saveContestants() {
  //Save contestants to local storage
  localStorage.setItem("contestants", JSON.stringify(aoContestants));
}

//Button click event listeners

//Button to play game
document.getElementById("btnPlayGame").addEventListener("click", playGame);

//Button to guess letter
document.getElementById("btnGuess").addEventListener("click", guessLetter);

//Button to reset games
document.getElementById("btnResetForm").addEventListener("click", resetMe);

//Button to play again
document
  .getElementById("btnPlayAgainSame")
  .addEventListener("click", playAgain);

//Button to start game
document.getElementById("btnPlayAgainDiff").addEventListener("click", playGame);

//Button to show games table
document.getElementById("btnShowGames").addEventListener("click", showGames);

//Button for the final guess
document.getElementById("btnFinalGuess").addEventListener("click", finalGuess);

//Check character input and only allow one character at a time
document.getElementById("inputLetter").addEventListener("keydown", (e) => {
  if (e.target.value.length > 0) {
    e.preventDefault();
    if (e.key == "Enter") {
      guessLetter();
    } else if (e.key.length > 1) {
      console.log("Not a character");
    } else if (!/\w/.test(e.key)) {
      alert("Please enter a valid character!");
    } else {
      e.target.value = e.key;
    }
  }
});

//Setup page when it is loaded
window.onload = () => {
  //Get contestants if there are any in local storage
  let storageContestants = JSON.parse(localStorage.getItem("contestants"));
  if (storageContestants !== null) {
    aoContestants = storageContestants;
  }

  //Make available and used letters bolded
  document.getElementById("availableChars");
};
