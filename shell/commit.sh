#!/bin/bash
# Ask the user for the issue they are working on
echo What issue are you working on?
read issue
echo What did you work on?
read message

if [ ! -z "$issue" ]
then
    issue="TG-$issue : "
fi

br=`git branch | grep "*"`

git add --all
git commit -m "$issue$message"
git push origin ${br/* /}

