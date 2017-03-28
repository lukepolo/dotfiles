#!/bin/bash
# Ask the user for the issue they are working on
echo What issue are you working on?
read issue
echo What did you work on?
read commit

br=`git branch | grep "*"`

git add --all
git commit -m "TG-$issue $commit"
git push origin ${br/* /}
