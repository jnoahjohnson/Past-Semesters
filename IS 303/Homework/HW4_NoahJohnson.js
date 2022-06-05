//Noah Johnson
//Section 2
/* Description of the Program

Write a program that prompts the user to enter in a number of teams to work with.

Then create an array of the team names which will be gathered from prompts and another array of the team wins which will be random numbers between 0 and 25.

Repeat this process for all of the teams. Then search through the array using a FOR Loop to find which team had the most wins. 
Then print out the team name and the number of their wins.

HOWEVER, if the user did not enter a valid number of teams, ONLY display an alert box that says "No teams to display" instead of all of the other output.

If there is data to display then display all of the teams and their records in a single alert box displaying the team name and the 
record on one line and then separating each of the team info using the new line character "\n".

*/

//Declare Variables
var teamNames = [];
var numTeamsWin = [];
var winningTeamIndex = 0;
var numTeams;
var iCount;
var resultText = "";

//Ask user for number of teams
numTeams = parseInt(prompt("How many teams?", 5));

//Check if the number of teams is a real number, if it is not, the program will stop and it will alert that there are no teams.
if (numTeams <= 0 || isNaN(numTeams)) {
    alert("No teams to display");
}
else {

    //For each team, the user will assign a name and the program will assign a random number between 1 and 25 for the number of gamaes that they won.
    for (iCount = 0; iCount < numTeams; iCount++) {

        teamNames.push(prompt("What is team " + (iCount + 1) + "'s name?"));
        numTeamsWin.push(Math.floor(Math.random() * 26));

    }

    //Uses a for loop to find the index position of the team that has the most wins
    for (iCount = 0; iCount < numTeams; iCount++) {

        if (numTeamsWin[iCount] > numTeamsWin[winningTeamIndex]) {
            winningTeamIndex = iCount;
        }

    }

    //Alerts the team that had the most wins and their record
    alert(teamNames[winningTeamIndex] + " had the most wins with a record of " + numTeamsWin[winningTeamIndex] + "-" + (25 - numTeamsWin[winningTeamIndex]));

    //Creates the text of all of the team names and their records
    for (iCount = 0; iCount < numTeams; iCount++) {

        resultText  = resultText + teamNames[iCount] + " " + numTeamsWin[iCount] + "-" + (25 - numTeamsWin[iCount]) + "\n";

    }

    //Alerts the text that was created which shows the team names and their records
    alert(resultText);
}