#!/bin/bash

REPOSITORY=$(git remote -v | awk '{print $2}' | head -1)
echo "Your actual repository is: $REPOSITORY"

git add .

git status

read -rp "Enter commit message: " commit_message
if git commit -m "$commit_message"; then

    echo "Your actual branch is: $(git branch)"
    read -rp "Enter branch name: " branch

    git push -u origin "$branch"
fi
