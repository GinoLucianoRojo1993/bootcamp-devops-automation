#!/bin/bash

if [ -z $ENVIRONMENT_FILE ]; then
    ENVIRONMENT_FILE="environment.json"
fi

if [ -z $GIT_BRANCH ]; then
    BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
else
  BRANCH_NAME=$GIT_BRANCH
fi

echo "Read CONFIG: $BRANCH_NAME FROM $ENVIRONMENT_FILE"

#print
jq -r ".environments.\"$BRANCH_NAME\"" $ENVIRONMENT_FILE