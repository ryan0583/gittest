#!/bin/bash

function appendChangelogLine {
    echo "$1" | cat - CHANGELOG.md > temp && mv temp CHANGELOG.md
}

function appendChangelogSection {
    appendChangelogLine ""

    DIR="./CHANGELOG/$1"

    if [ "$(ls -A "$DIR")" ]; then
        for file in "$DIR"/*
            do 
                if [[ "$file" != *"README.md"* ]];then
                    echo "Processing $file..."
                    appendChangelogLine "- $(cat $file)"
                    rm "$file"
                fi
        done
    fi

    appendChangelogLine ""
    appendChangelogLine "### $1"
}

appendChangelogSection "Removed"

appendChangelogSection "Changed"

appendChangelogSection "Added"

appendChangelogLine ""
appendChangelogLine "## [$1] - $date +"%Y-%m-%d""