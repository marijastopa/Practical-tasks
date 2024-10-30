#!/bin/bash

# Function to encrypt a letter by shifting it
shift_char() {
    local char="$1"
    local shift="$2"
    
    # Adjust the shift for large values
    shift=$(( shift % 26 ))

    # Check if the character is a lowercase letter
    if [[ "$char" =~ [a-z] ]]; then
        base=97  # ASCII value for 'a'
        echo "$(( ( $(printf "%d" "'$char") - $base + $shift + 26 ) % 26 + $base ))" | awk '{printf "%c", $1}'
    
    # Check if the character is an uppercase letter
    elif [[ "$char" =~ [A-Z] ]]; then
        base=65  # ASCII value for 'A'
        echo "$(( ( $(printf "%d" "'$char") - $base + $shift + 26 ) % 26 + $base ))" | awk '{printf "%c", $1}'
    
    # If not a letter, return the character as-is
    else
        echo "$char"
    fi
}

# Parse input arguments
shift_value=""
input_file=""
output_file=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        -s)
            shift_value="$2"
            shift 2
            ;;
        -i)
            input_file="$2"
            shift 2
            ;;
        -o)
            output_file="$2"
            shift 2
            ;;
        *)
            echo "Invalid option: $1"
            exit 1
            ;;
    esac
done

# Ensure that all required arguments are provided
if [[ -z "$shift_value" || -z "$input_file" || -z "$output_file" ]]; then
    echo "Usage: $0 -s <shift> -i <input file> -o <output file>"
    exit 1
fi

# Ensure the shift value is a valid number
if ! [[ "$shift_value" =~ ^-?[0-9]+$ ]]; then
    echo "Invalid shift value: $shift_value. Please provide a numeric value."
    exit 1
fi

# Check if the input file exists and is not empty
if [[ ! -f "$input_file" ]]; then
    echo "Input file not found!"
    exit 1
fi

if [[ ! -s "$input_file" ]]; then
    echo "Input file is empty."
    exit 1
fi

# Open output file for writing
> "$output_file"

# Process each character in the input file
while IFS= read -r -n1 char; do
    # Encrypt the character
    encrypted_char=$(shift_char "$char" "$shift_value")
    # Append encrypted character to output file
    echo -n "$encrypted_char" >> "$output_file"
done < "$input_file"

echo "Encryption complete. Encrypted text saved to $output_file."

