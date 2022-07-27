#!/usr/bin/env bash

# Usage: bash git-clone-custom.sh <repo-owner-name> <repo-name>
# Example: bash git-clone-custom.sh NokTNL test

# change the custom host identifier (between @ and :) according to your ~/.ssh/config
# Here the identifier is "github-personal" instead of the standard "github.com"

git clone git@github-personal:$1/$2.git

cd $2

# Change to whatever identifiers you want here:
git config user.name NokTNL
git config user.email noklamtsz@gmail.com