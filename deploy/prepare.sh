#!/bin/bash
ACTOR_EMAIL=$(docker run --rm golang:latest bash -c "go install github.com/cixtor/emailgetter@latest  && emailgetter -username $GITHUB_ACTOR")
echo "ACTOR_EMAIL: $ACTOR_EMAIL"

export COMMIT_USER_NAME=$(git log -1 --pretty=format:'%an')
export COMMIT_USER_EMAIL=$(git log -1 --pretty=format:'%ae')
export COMMIT_MESSAGE=$(git log -1 --format=%B)

echo "=> start with branch: $GITHUB_REF_NAME"
echo "=> COMMIT_USER_NAME: $COMMIT_USER_NAME"
echo "=> COMMIT_USER_EMAIL: $COMMIT_USER_EMAIL"
echo "=> COMMIT_MESSAGE: $COMMIT_MESSAGE"
echo "=> current dir content: $(ls -a)"
