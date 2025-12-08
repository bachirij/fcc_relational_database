#!/bin/bash

# Set the PSQL variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate a random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Prompt the username
echo "Enter your username:"
read USERNAME

# Get user data from database and trim spaces/newlines
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME';")
USER_DATA=$(echo "$USER_DATA" | sed 's/^ *//;s/ *$//' | tr -d '\r') # Removes leading/trailing spaces

# If USER_DATA is empty, user does not exist
if [[ -z $USER_DATA ]]
then
  # New user message
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Split USER_DATA into variables
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_DATA"

  # Existing user message
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start the guessing game
echo "Guess the secret number between 1 and 1000:"

NUMBER_OF_GUESSES=0

# Main guessing loop
while true
do
  read GUESS
  ((NUMBER_OF_GUESSES++))

  # Check if input is an integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Compare guess with secret number
  if (( GUESS < SECRET_NUMBER ))
  then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER ))
  then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    
    # Update the database before exiting
    if [[ -z $USER_DATA ]]
    then
      # Insert new user
      $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 1, $NUMBER_OF_GUESSES);" > /dev/null
    else
      # Update number of games played
      $PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$USERNAME';" > /dev/null

      # Update best game if improved
      if (( NUMBER_OF_GUESSES < BEST_GAME ))
      then
        $PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username='$USERNAME';" > /dev/null
      fi
    fi

    # To finish immediately the script after printing the message
    exit 0
  fi
done
