# Author: Noah Johnson
# description: It is soccers season and we need to get information on the teams!
# This program will gather information on all of the team and their players and
# then output all of the information

##########

# Class - Team
#
# Attributes:
# TeamName(String, Protected)
#
# Constructor:
# Receives parameter for Team Name
#
# Method:
# Get TeamName
# Update TeamName

class Team():
    def __init__(self, team_name):
        self._team_name = team_name

    # Get the team name
    def get_team_name(self):
        return self._team_name

    # Set the team name
    def set_team_name(self, new_team_name):
        self._team_name = new_team_name

# Class - SoccerTeam
# Inherits from the Team class
#
# Attributes:
# Wins(int), Losses(int), Draws(int)
# Players (Player)
#
# Constructor:
# TeamName, Wins, Losses, Draws


class SoccerTeam(Team):
    def __init__(self, soccer_team_name, wins, losses, draws):
        super().__init__(team_name)
        self.wins = wins
        self.losses = losses
        self.draws = draws
        self.players = []


# Class - Person
#
# Attributes:
# FirstName(String, Protected) LastName(String, Protected)
#
# Constructor:
# Receive FirstName and LastName
#
# Methods:
# Get attributes
# Update attributes

class Person():
    def __init__(self, person_first_name, person_last_name):
        self._first_name = person_first_name
        self._last_name = person_last_name

    # Get attributes
    def get_first_name(self):
        return self._first_name

    def get_last_name(self):
        return self._last_name

    def get_full_name(self):
        return f"{self._first_name} {self._last_name}"

    # Set attributes
    def set_first_name(self, new_first_name):
        self._first_name = new_first_name

    def set_last_name(self, new_last_name):
        self._last_name = new_last_name

    def set_full_name(self, new_first_name, new_last_name):
        self._first_name = new_first_name
        self._last_name = new_last_name

# Class - Player
# Inherits from Person class
#
# Attributes:
# GoalsScored(int, private)
#
# Constructor:
# Initialize GoalScored to 0, pass on name to super
#
# Methods:
# GetGoalsScored
# UpdateGoalsScored


class Player(Person):
    def __init__(self, player_first_name, player_last_name):
        super().__init__(player_first_name, player_last_name)
        self.__goals_scored = 0

    # Get goals scored
    def get_goals_scored(self):
        return self.__goals_scored

    # Set goals scored
    def set_goals_scored(self, new_goals_scored):
        self.__goals_scored = new_goals_scored

    # Score single goal (add one to current goals scored)
    def score_goal(self):
        self.__goals_scored += 1

##########
# Function to loop until user inputs valid integer


def get_integer_input(prompt, min_input):
    input_valid = False
    user_int = 0

    # Loop until there is a valid input
    while(input_valid == False):
        try:
            # Get user input
            user_int = int(input(prompt))
        except:
            # If there is no valid input, then print this statement and try again to get valid input
            print("Please enter a valid number")
        else:
            # See if the number of teams is greater than or equal to the min_input
            if user_int < min_input:
                print(
                    f"Please enter a valid number (greater than {min_input})")
            else:
                input_valid = True

    return user_int


# Start of output
print("Welcome to Soccer Season!")

# Get valid number of teams from get_integer_input funciton above
num_teams = get_integer_input("How many teams to enter? ", 1)

# Get team information

# List of teams
team_list = []

# Loop to load up soccer teams and attributes
for team_num in range(0, num_teams):
    # Get team attributes
    team_name = input("What is the name of the team? ")
    team_wins = get_integer_input("How many wins does the team have? ", 0)
    team_losses = get_integer_input("How many losses does the team have? ", 0)
    team_draws = get_integer_input("How many draws does the team have? ", 0)

    # Initialize new Team
    current_team = SoccerTeam(team_name, team_wins, team_losses, team_draws)

    # Get number of players
    num_players = get_integer_input(
        "How many players does the soccer team have? ", 1)

    # Loop for each player
    for player_num in range(1, num_players + 1):
        player_first_name = input(
            f"What is player {player_num}\'s first name? ")
        player_last_name = input(f"What is player {player_num}\'s last name? ")

        # Initialize new Player and add to current team
        current_team.players.append(
            Player(player_first_name, player_last_name))

    # Append the current team to the team list
    team_list.append(current_team)

# Print out all SoccerTeam and Player information

# Header
print("\n" + "*" * 50)
print("*" * 14, "Soccer Season Teams!", "*" * 14)
print("*" * 50, "\n")

for team in team_list:
    # Print out team information
    print("Team:", team.get_team_name().ljust(12), "Wins:", str(team.wins).ljust(
        3), "Losses:", str(team.losses).ljust(3), "Draws:", str(team.draws).ljust(3))
    # Print out player header
    print("Players".ljust(22), "Number of Goals")
    for player in team.players:
        print(player.get_full_name().ljust(22), player.get_goals_scored())

    # Print new line after each team
    print("\n")
