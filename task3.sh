#!/bin/bash

# Loop from 1 to 100
for ((i=1; i<=100; i++))
do
    # Check if the number is a multiple of both 3 and 5
    if (( i % 3 == 0 && i % 5 == 0 )); then
        echo "FizzBuzz"
    # Check if the number is a multiple of 3
    elif (( i % 3 == 0 )); then
        echo "Fizz"
    # Check if the number is a multiple of 5
    elif (( i % 5 == 0 )); then
        echo "Buzz"
    else
        # If not a multiple of 3 or 5, print the number
        echo "$i"
    fi
done

