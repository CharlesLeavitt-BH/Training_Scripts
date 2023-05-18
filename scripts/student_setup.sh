#!/bin/bash

# This is intended to be run only after cloning a student repo for initial setup.

# this can be modified to the url of the template repo:
upstream_template="git@github.com:CharlesLeavitt-BH/test_orig.git"


# Sets the remote upstream 
git remote add upstream $upstream_template;

# pulls the remote upstream and forces it to merge
git pull upstream main --allow-unrelated-histories --no-edit -f;
git push origin main;
