#!/bin/bash

# prerequisite: You need to have the GitHub cli "gh" installed and authenticated.
# documentation here: https://cli.github.com/manual/installation

# these need to be set to the correct values:

owner_name="CharlesLeavitt-BH";	# this is the main github account name
template_name="test_orig";		# name of the template repo being "forked"

if ! command -v gh &> /dev/null
then
    echo "gh could not be found"
    echo "Please install the GitHub CLI: gh"
    echo "https://cli.github.com/manual/installation"
    exit
fi

# usage statement: 
usage="Provide github username as the only argument."

if [ $# -ne 1 ]; then
echo $usage;
elif [ "$1" = "-h" ] || [ "$1" = "-help" ] ; then
echo $usage;
exit
fi

github_account=$1; 
echo "github_account: $github_account"

# creates a new repo from the template
gh repo create $github_account-JQR --private --template $template_name;

# invites the github account as a colaborator on the new repo with write perms.
gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/$owner_name/$github_account-JQR/collaborators/$github_account \
  -f permission='write' 
# invites the github account as a colaborator on the template with read perms.  
gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/$owner_name/$template_name/collaborators/$github_account \
  -f permission='read' 
  
