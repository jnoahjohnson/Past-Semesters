//Noah Johnson
//Custom Javascript to complete the IS 303 Final which is a Pokemon battle

//Global Variables for the user and opponent trainers
var userTrainer;
var opponentTrainer;

class Person {
    firstName;
    lastName;

    constructor(firstName, lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

}

class Trainer extends Person {
    type;
    party = [];
    currPokemon;
    currPokemonIndex = 0;
    wins = 0;
    losses = 0;
    sprite;

    constructor(firstName, lastName, type) {
        super(firstName, lastName);
        this.type = type;
        this.sprite = "images/" + type + ".png";
    }


    addPokemonToParty(newPokemonObject) {
        this.party.push(newPokemonObject);
    }

    nextPokemon() {
        this.currPokemonIndex += 1;
    }

    clearParty() {
        this.party = [];
    }
}

class Pokemon {
    name;
    type;
    image;
    healthPower;
    healthPowerBar;

    constructor(name, type, image, healthPowerBar) {
        this.name = name;
        this.type = type;
        this.image = image;
        this.healthPower = 100;
    
    }

    updateHealthPower(newHealthPower) {
        this.healthPower = newHealthPower;
        //Checks to see if health dropped below 0
        if (this.healthPower < 0) {
            this.healthPower = 0;
        }
        
    }

    takeDamage(numDamage) {
        this.healthPower -= numDamage;
        this.updateHealthPower(this.healthPower);
    }
}

function restart() {
    //Restarts the game
}

function calculateEffectiveness(userPokemonType, oppPokemonType) {
    //Checks the user pokemon type against the opponent pokemon type
    if (userPokemonType === oppPokemonType) {
        return .5;
    }
    else if (userPokemonType == "Fire" && oppPokemonType == "Water") {
        return .5;
    }
    else if (userPokemonType == "Fire" && oppPokemonType == "Grass") {
        return 1.5;
    }
    else if (userPokemonType == "Water" && oppPokemonType == "Fire") {
        return 1.5;
    }
    else if (userPokemonType == "Water" && oppPokemonType == "Grass") {
        return .5;
    }
    else if (userPokemonType == "Grass" && oppPokemonType == "Fire") {
        return .5;
    }
    else if (userPokemonType == "Grass" && oppPokemonType == "Water") {
        return 1.5;
    }
    else {
        return 1;
    }
}

function attack() {
    var attackEffectiveness;
    var damage = 10;
    var multiplier;

    var attackPoints;

    var currUserPokemonIndex = userTrainer.currPokemonIndex;
    var currOppPokemonIndex = opponentTrainer.currPokemonIndex;

    var currUserPokemon = userTrainer.party[currUserPokemonIndex];
    var currOppPokemon = opponentTrainer.party[currOppPokemonIndex];

    //Display the attack
    document.getElementById("myMove").innerHTML = currUserPokemon.name + " attacks!";

    //Checks the effectiveness of the pokemon attack against the opponent
    attackEffectiveness = calculateEffectiveness(currUserPokemon.type, currOppPokemon.type);

    if (attackEffectiveness === 1.5) {
        document.getElementById("myEffectiveness").innerHTML = "It was super effective!";
    }
    else if (attackEffectiveness == .5) {
        document.getElementById("myEffectiveness").innerHTML = "It was not very effective...";
    }
    else {
        document.getElementById("myEffectiveness").innerHTML = "";
    }

    multiplier = Math.random();

    //User attacks the opponent
    if (multiplier >= .9) {
        document.getElementById("myExtra").innerHTML = "Critical Hit";
    }
    else if (multiplier <= .1) {
        document.getElementById("myExtra").innerHTML = "But it missed";
    }
    else {
        document.getElementById("myExtra").innerHTML = "";
    }

    attackPoints = damage * multiplier * attackEffectiveness;

    currOppPokemon.takeDamage(attackPoints);

    //Opponent attacks

    //Display the attack
    document.getElementById("oppMove").innerHTML = currOppPokemon.name + " attacks!";

    //Checks the effectiveness of the opponent pokemon agaisnt the user
    attackEffectiveness = calculateEffectiveness(currOppPokemon.type, currUserPokemon.type);

    if (attackEffectiveness === 1.5) {
        document.getElementById("oppEffectiveness").innerHTML = "It was super effective!";
    }
    else if (attackEffectiveness == .5) {
        document.getElementById("oppEffectiveness").innerHTML = "It was not very effective...";
    }
    else {
        document.getElementById("oppEffectiveness").innerHTML = "";
    }

    multiplier = Math.random();

    //Opponent attacks the user
    if (multiplier >= .9) {
        document.getElementById("oppExtra").innerHTML = "Critical Hit";
    }
    else if (multiplier <= .1) {
        document.getElementById("oppExtra").innerHTML = "But it missed"
    }
    else {
        document.getElementById("oppExtra").innerHTML = "";
    }

    attackPoints = damage * multiplier * attackEffectiveness;

    currUserPokemon.takeDamage(attackPoints);

    //Checks to see if any pokemon fainted
    if(currUserPokemon.healthPower === 0) {
        document.getElementById("myFainted").innerHTML = currUserPokemon.name + " fainted!";
        userTrainer.nextPokemon();
    }
    else {
        document.getElementById("myFainted").innerHTML = "";
    }

    if (currOppPokemon.healthPower === 0) {
        document.getElementById("oppFainted").innerHTML = currOppPokemon.name + " fainted!";
        opponentTrainer.nextPokemon();
    }
    else {
        document.getElementById("oppFainted").innerHTML = "";
    }

    //Checks to see if there is a winner
    if(userTrainer.currPokemonIndex === 3) {
        document.getElementById("overallDisplayText").innerHTML = opponentTrainer.firstName + " " + opponentTrainer.lastName + " wins!";
        document.getElementById("btnAttack").style.visibility = "hidden";
        document.getElementById("btnRestart").style.visibility = "visible";
        opponentTrainer.wins += 1;
    }
    if(opponentTrainer.currPokemonIndex === 3) {
        document.getElementById("overallDisplayText").innerHTML = userTrainer.firstName + " " + userTrainer.lastName + " wins!";
        document.getElementById("btnAttack").style.visibility = "hidden";
        document.getElementById("btnRestart").style.visibility = "visible";
        userTrainer.wins += 1;
    }

}

function battle() {
    //Get information from the form
    var userFirstName = document.getElementById("firstName");
    var userLastName = document.getElementById("lastName");
    var userTrainerType = document.getElementById("trainerType");
    var partyOne = document.getElementById("partyOne");
    var partyTwo = document.getElementById("partyTwo");
    var partyThree = document.getElementById("partyThree");

    //Output Variables
    var userSprite = document.getElementById("mySprite");
    var userName = document.getElementById("myName");
    var userWins = document.getElementById("myWins");
    var userLosses = document.getElementById("myLosses");
    var pokemonOne = document.getElementById("pokemonOne");
    var pokemonTwo = document.getElementById("pokemonTwo");
    var pokemonThree = document.getElementById("pokemonThree");

    //Opponent Output Variables
    var oppSprite = document.getElementById("oppSprite");
    var oppName = document.getElementById("oppName");
    var oppWins = document.getElementById("oppWins");
    var oppLosses = document.getElementById("oppLosses");


    //Indexes for the name, type and image
    var pokemonNameIndex = 0;
    var pokemonTypeIndex = 1;
    var pokemonImageIndex = 2;

    //Other Variables
    var numberOfPokemon = 3;
    var randomPokemon;

    //Show the attack button
    document.getElementById("btnAttack").style.visibility = "visible";

    //Check to see if the first name and last name have data
    if (userFirstName.value === "") {
        alert("You must enter a first name");
        userFirstName.focus();
    }
    else if (userLastName.value === "") {
        alert("You must enter a last name");
        userLastName.focus();
    }
    else {

        //Create a new person object for the user
        userTrainer = new Trainer(userFirstName.value, userLastName.value, userTrainerType.value);

        //Creates the opponent trainer object
        opponentTrainer = new Trainer("Team", "Rocket", "Team_Rocket");

        //Displays the User
        userSprite.src = userTrainer.sprite;
        userName.innerHTML = userTrainer.firstName + " " + userTrainer.lastName;
        userWins.innerHTML = userTrainer.wins;
        userLosses.innerHTML = userTrainer.losses;

        //Displays the opponent
        oppSprite.src = opponentTrainer.sprite;
        oppName.innerHTML = opponentTrainer.firstName + " " + opponentTrainer.lastName;
        oppWins.innerHTML = opponentTrainer.wins;
        oppLosses.innerHTML = opponentTrainer.losses;

        
        //Load up the user's Pokemon
        userTrainer.addPokemonToParty(new Pokemon(
            pokemonArray[partyOne.value][pokemonNameIndex], 
            pokemonArray[partyOne.value][pokemonTypeIndex],
            pokemonArray[partyOne.value][pokemonImageIndex]));

        userTrainer.addPokemonToParty(new Pokemon(
            pokemonArray[partyTwo.value][pokemonNameIndex], 
            pokemonArray[partyTwo.value][pokemonTypeIndex],
            pokemonArray[partyTwo.value][pokemonImageIndex]));

        userTrainer.addPokemonToParty(new Pokemon(
            pokemonArray[partyThree.value][pokemonNameIndex], 
            pokemonArray[partyThree.value][pokemonTypeIndex],
            pokemonArray[partyThree.value][pokemonImageIndex]));
        
        //Load up the opponent's Pokemon
        for (iCount = 0; iCount < numberOfPokemon; iCount++) {
            randomPokemon = Math.floor(Math.random() * 8);

            opponentTrainer.addPokemonToParty(new Pokemon(
                pokemonArray[randomPokemon][pokemonNameIndex],
                pokemonArray[randomPokemon][pokemonTypeIndex],
                pokemonArray[randomPokemon][pokemonImageIndex]));
        }

        //Display User Pokemon
        document.getElementById("myPokemonImg1").src = userTrainer.party[0].image;
        document.getElementById("myPokemonName1").innerHTML = userTrainer.party[0].name;
        var pokemon1HP = new ldBar("#myPokemonHP1");
        pokemon1HP.set(100);

        document.getElementById("myPokemonImg2").src = userTrainer.party[1].image;
        document.getElementById("myPokemonName2").innerHTML = userTrainer.party[1].name;
        var pokemon2HP = new ldBar("#myPokemonHP2");
        pokemon2HP.set(100);

        document.getElementById("myPokemonImg3").src = userTrainer.party[2].image;
        document.getElementById("myPokemonName3").innerHTML = userTrainer.party[2].name;
        var pokemon3HP = new ldBar("#myPokemonHP3");
        pokemon3HP.set(100);

        //Display Opponent Pokemon
        document.getElementById("oppPokemonImg1").src = opponentTrainer.party[0].image;
        document.getElementById("oppPokemonName1").innerHTML = opponentTrainer.party[0].name;
        var oppPokemon1HP = new ldBar("#oppPokemonHP1");
        oppPokemon1HP.set(100);

        document.getElementById("oppPokemonImg2").src = opponentTrainer.party[1].image;
        document.getElementById("oppPokemonName2").innerHTML = opponentTrainer.party[1].name;
        var oppPokemon2HP = new ldBar("#oppPokemonHP2");
        oppPokemon2HP.set(100);

        document.getElementById("oppPokemonImg3").src = opponentTrainer.party[2].image;
        document.getElementById("oppPokemonName3").innerHTML = opponentTrainer.party[2].name;
        var oppPokemon3HP = new ldBar("#oppPokemonHP3");
        oppPokemon3HP.set(100);
       
    }





}