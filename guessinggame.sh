#!/bin/bash

# We have to let the user know if their guess is too high, or too low. If the user didn't
# enter a valid number, they will be alerted to that. This function will just echo the
# "hint" depending on the first two arguments (input, number of files).
function get_hint {
    if [[ ! $1 =~ ^[0-9]+$ ]]; then
        echo "not a valid number"
    elif [[ $1 -gt $2 ]]; then
        echo "too high"
    else
        echo "too low"
    fi  
}

# ls -la shows all files and folders in the current directory. Folders should be excluded,
# so any line that starts with "d" (for directory) should be excluded.
num_files=$(ls -la | egrep "^[^d]" | wc -l)

echo "Guess how many files are in this directory?"
read input

# We should check for two conditions. The first checks if the input is even a number at all.
# If it's not, the second conditional sometimes throws an error, as BASH may try to parse
# the input to some kind of number, which may or may not work. Since we only accept numbers
# that are greater than or equal to 0, this regular expression works fine.
while [[ ! $input =~ ^[0-9]+$ ]] || [[ $input -ne $num_files ]]; do
    echo "Your answer is $(get_hint $input $num_files). Please try again:"
    read input
done

echo "Correct! Congratulations!"
