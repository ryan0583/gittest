#!/bin/bash

git fetch
git checkout main
git branch -D dev

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
git branch -D main
git checkout main
git pull
git merge --ff-only $1