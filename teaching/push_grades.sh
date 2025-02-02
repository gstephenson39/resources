#!/bin/bash

# this script iterates through student repos to push just the file containing TA edits
# you will need to update your base directory, structure of student directory naming, file name, and commit message


# set the base directory
BASE_DIR="/Users/grace/rprojects/EDS-240-class/hw1_grading"

# navigate to the base directory
cd "$BASE_DIR" || { echo "Base directory not found!"; exit 1; }

# loop through each student directory
# student directories must all have the same header; ex: eds240-hw1

# loop code:
for dir in eds240-hw1-*; do
    if [ -d "$dir" ]; then
        echo "Processing $dir..."

        # navigate into the student repo
        cd "$dir" || continue

        # ensure the file exists
        if [ -f "Part1_SS.qmd" ]; then # I named my file Part1_SS.qmd, you will have to ensure your file with edits has the same name of a similar enough structure

            # add the file to student github, commit, and push
            git add Part1_SS.qmd
            git commit -m "Releasing HW #1 Part 1 grading feedback." # this will need to be updated with a particular message relating to the assignment being graded
            git push origin main 2>/dev/null || git push origin master
        else
            echo "Part1_SS.qmd not found in $dir!"
        fi

        # return to the base directory
        cd "$BASE_DIR" || exit 1
    fi
done

echo "All repositories processed!"

