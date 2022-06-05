//Noah Johnson
//Section 2

/* Description of the program

Program that lets a user assign a team name and chose the number of games in a season. 

The program then randomizes a score for the user team and the opponent team, keeping track of the win/loss record of the user team 
and calculates a percentage of the amount of wins.

Based on the percentage, the team is assigned a bracket and the team name, record and bracket are alerted to the user.

*/

//Declare Variables
var teamName;
var numGames;
var numGamesWon = 0;
var numGamesLost = 0;
var iCount;
var userTeamScore;
var opponentTeamScore;
var resultText;
var percentOfGamesWon;

//Prompt user for their team name and how many games will be in the season
teamName = prompt("What is your team name?", "BYU");
numGames = parseInt(prompt("How many games are in the season?", 0));

//Loop for each game in the season
for(iCount = 0; iCount < numGames; iCount++) {

    //Prompt for the user to enter an opponent name
    prompt("What is the opponent's team name?", "Utah");

    //Generate random numbers for user team and opponent team. If there is a tie, loop until there is not a tie
    do {
        userTeamScore = Math.floor(Math.random() * 101);
        opponentTeamScore = Math.floor(Math.random() * 101);
    } while (userTeamScore === opponentTeamScore);

    //Compare user team score and opponent to see if user team won or lost
    if (userTeamScore > opponentTeamScore) {
        numGamesWon = numGamesWon + 1;
    }
    else if(userTeamScore < opponentTeamScore) {
        numGamesLost = numGamesLost + 1;
    }

}

//Calculate percentage of how many games were won
percentOfGamesWon = numGamesWon / numGames;

//Check percentage to see what bracket the team is in. Assign that to the result text.
if (percentOfGamesWon >= .75) {
    resultText = "March Madness";
}
else if (percentOfGamesWon >= .5) {
    resultText = "NIT Tournament";
}
else {
    resultText = "See you next year";
}

//Alert the team name, their record and what bracket they are apart of
alert(teamName + " " + numGamesWon + "-" + numGamesLost + "\n" + resultText);