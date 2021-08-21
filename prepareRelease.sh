#!/bin/bash

# Switch to dev branch and ensure we're up to date
git checkout dev
git pull

# Add the entries in the CHANGELOG folder to the CHANGELOG file
./writeChangelog.sh $1

# Commit the changelog changes
git add .
git commit -m "Update change log"

# Tag the last commit with the version number we're going to use for the release
git tag $1

# Checkout main and fastforward it to the tag we just created.
git checkout main
git pull
git merge --ff-only $1