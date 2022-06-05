//Noah Johnson

//Section 2

/* Description of the program

Basic program that assigns two random numbert to two variables, byuScore and gonzagaScore. Determines who the winner is and alert the user the score and who won.

*/

//declare your variables

var byuScore;
var gonzagaScore;
var winnerText;

//generate random numbers

byuScore = Math.floor(Math.random() * 101);
gonzagaScore = Math.floor(Math.random() * 101);

//determine who wins

if (byuScore == gonzagaScore) {
    winnerText = "Tie game";
}
else if (byuScore > gonzagaScore) {
    winnerText = "BYU wins";
}
else if (gonzagaScore > byuScore) {
    winnerText = "Gonzaga wins";
}
 
//display the results using an alert box

var output = "BYU " + byuScore + "\n" + "Gonzaga " + gonzagaScore + "\n\n" + winnerText;

alert(output);