#!/bin/bash

# Function to calculate the Fibonacci number
fib() {
    n=$1

    if [ "$n" -le 0 ]; then
        echo 0
    elif [ "$n" -eq 1 ]; then
        echo 1
    else
        a=0
        b=1
        for (( i=2; i<=n; i++ ))
        do
            temp=$b
            b=$((a + b))
            a=$temp
        done
        echo $b
    fi
}

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Please provide a number."
else
    if ! [[ "$1" =~ ^[0-9]+$ ]]; then
        if [[ "$1" =~ ^-?[0-9]+$ ]]; then
            echo "Negative numbers are not allowed. Please enter a non-negative integer."
        elif [[ "$1" =~ ^[0-9]+\.[0-9]+$ ]]; then
            echo "Decimal numbers are not valid. Please enter a whole number."
        else
            echo "Invalid input. Please enter a valid number."
        fi
    else
        result=$(fib $1)
        echo "For your input number $1, the Fibonacci number is $result."
    fi
fi

