# Practical-tasks

This repository contains a set of Bash scripting tasks that demonstrate various programming concepts, from implementing mathematical functions to file manipulation and system reporting.

## **Task Descriptions**

### _Task 1: Fibonacci Sequence Function_

The Fibonacci sequence is a series of numbers in which each number is the sum of the two preceding ones. In mathematical terms, the sequence Fn of Fibonacci numbers is defined by the recurrence relation:
Fn = Fn-1 + Fn-2
With the following seed values:
F0 = 0 and F1 = 1
Write a function fib that returns Fn based on the input integer n:

- If n = 0, fib should return 0
- If n = 1, fib should return 1
- If n > 1, it should return Fn-1 + Fn-2


### _Task 2: Arithmetic Operations Script_

Create a Bash script that accepts the following parameters:

-o <operation>: Specifies the operation to be performed (+, -, *, %)

-n <numbers>: A sequence of numbers on which the operation will be performed

-d: (Optional) Debug flag to print additional information

For example:

	./your_script.sh -o % -n 5 3 -d  # Result: 2

	./your_script.sh -o + -n 3 5 7 -d  # Result: 15

If the -d flag is passed, the script must print:

- User: The username of the user running the script
- Script: The script name
- Operation: The operation to be performed
- Numbers: All space-separated numbers in the input sequence

### _Task 3: FizzBuzz Script_

Write a script that prints the numbers from 1 to 100 with the following conditions:
- If a number is a multiple of 3, print "Fizz" instead of the number
- If a number is a multiple of 5, print "Buzz" instead of the number
- If a number is a multiple of both 3 and 5, print "FizzBuzz"

### _Task 4: Caesar Cipher Script_

Write caesar cipher script accepting three parameters -s < shift > -i < input file > -o < output file >

### _Task 5: Text Manipulation Script_

Write script with following functionality:
- If -v tag is passed, replaces lowercase characters with uppercase and vise versa
- If -s is passed, script substitutes <A_WORD> with <B_WORD> in text (case sensitive)
- If -r is passed, script reverses text lines
- If -l is passed, script converts all the text to lower case
- If -u is passed, script converts all the text to upper case
- Script should work with -i <input file> -o <output file> tags

### _Task 6: System Report Script_

Write a script that generates a system report containing the following information:
- Current date and time
- Name of the current user
- Internal IP address and hostname
- External IP address
- Name and version of the Linux distribution
- System uptime
- Information about used and free space in / (in GB)
- Information about total and free RAM
- Number and frequency of CPU cores

## **Usage**

Each task is contained in its respective script file (e.g., task1.sh, task2.sh, etc.). Refer to the comments within each script for specific usage instructions.

## **Folder Structure**

The following files are associated with each task:

task4: task4.sh, input.txt, output.txt

task5: task5.sh, input2.txt, output2.txt

## **Instructions for Running Scripts**

Make each script executable using:

	chmod u+x <script_name>.sh

Run the script using the instructions provided for each task.
