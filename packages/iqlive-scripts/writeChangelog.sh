#!/bin/bash

function appendChangelogLine {
    echo "$1" | cat - CHANGELOG.md > temp && mv temp CHANGELOG.md
}

function appendChangelogSection {
    DIR="./CHANGELOG/$1"

    WROTELINE=0

    if [ "$(ls -A "$DIR")" ]; then
        for file in "$DIR"/*
            do 
                if [[ "$file" != *"README.md"* ]];then
                    if [[ $WROTELINE == 0 ]]; then
                        appendChangelogLine ""
                    fi

                    echo "Processing $file..."
                    appendChangelogLine "- $(cat $file)"
                    rm "$file"
                    WROTELINE=1
                fi
        done
    fi

    if [[ $WROTELINE == 1 ]]; then
        appendChangelogLine ""
        appendChangelogLine "### $1"
    fi
}

appendChangelogSection "Removed"

appendChangelogSection "Changed"

appendChangelogSection "Added"

appendChangelogLine ""

currentDate=`date +"%Y-%m-%d"`

appendChangelogLine "## [$1] - $currentDate"