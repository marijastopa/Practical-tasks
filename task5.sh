#!/bin/bash

# Initialize variables
input_file=""
output_file=""
substitute_a=""
substitute_b=""
reverse_flag=false
lowercase_flag=false
uppercase_flag=false
swapcase_flag=false

# Parse input arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -v)
            swapcase_flag=true
            shift
            ;;
        -s)
            if [[ -z "$2" || -z "$3" ]]; then
                echo "Error: You must provide both <A_WORD> and <B_WORD> for substitution."
                exit 1
            fi
            substitute_a="$2"
            substitute_b="$3"
            shift 3
            ;;
        -r)
            reverse_flag=true
            shift
            ;;
        -l)
            lowercase_flag=true
            shift
            ;;
        -u)
            uppercase_flag=true
            shift
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
            echo "Usage: ./task5.sh [-v] [-s A_WORD B_WORD] [-r] [-l] [-u] [-i input_file] [-o output_file]"
            exit 1
            ;;
    esac
done

# Check for conflicting flags: Cannot use both -l (lowercase) and -u (uppercase) together
if [[ "$lowercase_flag" == true && "$uppercase_flag" == true ]]; then
    echo "Error: Cannot use both -l (lowercase) and -u (uppercase) together."
    exit 1
fi

# Ensure input file is valid, if provided
if [[ -z "$input_file" ]]; then
    echo "Error: Input file is required."
    exit 1
fi

if [[ ! -f "$input_file" ]]; then
    echo "Error: Input file does not exist."
    exit 1
fi

# Read input from the file
text=$(cat "$input_file")

# Check for empty input
if [[ -z "$text" ]]; then
    echo "Error: No input provided in the file."
    exit 1
fi

# Perform substitution if valid
if [[ ! -z "$substitute_a" && ! -z "$substitute_b" ]]; then
    if [[ "$text" == *"$substitute_a"* ]]; then
        text=$(echo "$text" | sed "s/$substitute_a/$substitute_b/g")
    else
        echo "Warning: '$substitute_a' not found in the text."
    fi
fi

# Reverse lines
if [[ "$reverse_flag" == true ]]; then
    text=$(echo "$text" | awk '{print NR, $0}' | sort -r | cut -d' ' -f2-)
fi

# Swap case
if [[ "$swapcase_flag" == true ]]; then
    text=$(echo "$text" | tr 'a-zA-Z' 'A-Za-z')
fi

# Convert to lowercase
if [[ "$lowercase_flag" == true ]]; then
    text=$(echo "$text" | tr 'A-Z' 'a-z')
fi

# Convert to uppercase
if [[ "$uppercase_flag" == true ]]; then
    text=$(echo "$text" | tr 'a-z' 'A-Z')
fi

# Output to file or terminal
if [[ -n "$output_file" ]]; then
    echo "$text" > "$output_file"
    echo "Processed text written to $output_file."
else
    echo "Processed text:"
    echo "$text"
fi

