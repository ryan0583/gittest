#!/bin/bash

echo "Switch to dev branch and ensure we're up to date..."
git checkout dev
git pull

echo "Add the entries in the CHANGELOG folder to the CHANGELOG file..."
./writeChangelog.sh $1

echo "Commit the changelog changes..."
git add .
git commit -m "Update change log"

echo "Tag the last commit with the version number we're going to use for the release..."
git tag $1

echo "Checkout main and fastforward it to the tag we just created..."
git checkout main
git pull
git log
git merge --ff-only $1