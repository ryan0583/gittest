#!/bin/bash

echo "Add the entries in the CHANGELOG folder to the CHANGELOG file..."
./scripts/writeChangelog.sh $1

echo "Commit the changelog changes..."
git add .
git commit -m "Update change log for release $1"

echo "Tag the last commit with the version number we're going to use for the release..."
git tag $1