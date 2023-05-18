#!/bin/bash

# This scrip will make a backup of the current branch, then switch to the "main" branch and pull the upstream to get any updates from the template repo.

DATE=$(date +%s)

echo "Backing up current main as branch: backup_$(date -d"@$DATE" '+%Y-%m-%d-%H-%M')"
git branch "backup_$(date -d"@$DATE" '+%Y-%m-%d-%H-%M')";

echo "Switching to main branch"
git checkout main
echo "Pulling update from upstream main:"
git pull upstream main
