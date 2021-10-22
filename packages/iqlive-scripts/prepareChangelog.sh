#!/bin/bash

echo "Add the entries in the CHANGELOG folder to the CHANGELOG file..."
./packages/iqlive-scripts/writeChangelog.sh $1

echo "Commit the changelog changes..."
git add .
git commit -m "[changelog] Update change log for release $1"