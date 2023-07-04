#!/bin/bash

REPOSITORY=$(git remote -v | awk '{print $2}' | head -1)
echo "Your actual repository is: $REPOSITORY"

git add .

git status

read -p "Enter commit message: " commit_message
git commit -m "$commit_message"

echo "Your actual branch is: $(git branch)"
read -p "Enter branch name: " branch

git push -u origin "$branch"
