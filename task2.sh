#!/bin/bash

# Initialize variables
operation=""
numbers=()
debug_flag=false

# Parse input arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -o)
            operation="$2"
            shift 2
            ;;
        -n)
            shift
            while [[ "$1" =~ ^-?[0-9]+$ ]]; do  # Allow both positive and negative integers
                numbers+=("$1")
                shift
            done
            ;;
        -d)
            debug_flag=true
            shift
            ;;
        *)
            echo "Invalid option or argument: $1"
            exit 1
            ;;
    esac
done

# Check if operation and numbers are provided
if [ -z "$operation" ]; then
    echo "Please provide an operation (-o)."
    exit 1
fi

if [ ${#numbers[@]} -eq 0 ]; then
    echo "Please provide a sequence of numbers (-n)."
    exit 1
fi

# Validate if the operation is supported
if [[ "$operation" != "+" && "$operation" != "-" && "$operation" != "*" && "$operation" != "%" ]]; then
    echo "Invalid operation: $operation. Please use one of +, -, *, %."
    exit 1
fi

# Perform the operation with error handling
result="${numbers[0]}"
for (( i=1; i<${#numbers[@]}; i++ )); do
    # Handle division/modulo by zero
    if [[ "$operation" == "%" && "${numbers[i]}" -eq 0 ]]; then
        echo "Error: Division by zero is not allowed with the '%' operation."
        exit 1
    fi

    case "$operation" in
        "+")
            result=$((result + numbers[i]))
            ;;
        "-")
            result=$((result - numbers[i]))
            ;;
        "*")
            result=$((result * numbers[i]))
            ;;
        "%")
            result=$((result % numbers[i]))
            ;;
    esac
done

# Debug output if -d flag is set
if [ "$debug_flag" = true ]; then
    echo "User: $(whoami)"
    echo "Script: $0"
    echo "Operation: $operation"
    echo "Numbers: ${numbers[*]}"
fi

echo "Result: $result"

