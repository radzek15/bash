#!/bin/bash

repository="https://github.com/radzek15/bash"
branch="master"

git add .

read -p "Enter commit message: " commit_message

git commit -m "$commit_message"

git push "$repository" "$branch"
