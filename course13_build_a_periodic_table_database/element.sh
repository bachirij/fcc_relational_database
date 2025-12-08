#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# If no argument was provided, ie. is empty
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

# Store the first argument passed in the terminal
INPUT=$1

# Check if input is a number (atomic number) (ex: 1 or 2)
if [[ $INPUT =~ ^[0-9]+$ ]] 
  then
    CONDITION="atomic_number=$INPUT"
# If input is 1- or 2-letter symbol (ex: H or He)
elif [[ $INPUT =~ ^[A-Za-z]{1,2}$ ]]
  then
  CONDITION="symbol='$INPUT'"
# Otherwise treat as name (ex: Hydrogen or Helium)
else
  CONDITION="name='$INPUT'"
fi

# Query for element using the previous condition
ELEMENT_INFO=$($PSQL "
SELECT elements.atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type 
FROM elements 
JOIN properties USING(atomic_number) 
JOIN types USING(type_id)
WHERE $CONDITION;")

# If no result
if [[ -z $ELEMENT_INFO ]]
  then
    echo "I could not find that element in the database."
    exit
fi

# Print values from ELEMENT_INFO queried before
echo "$ELEMENT_INFO" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME MASS MELT BOIL TYPE
do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
done
