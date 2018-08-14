#!/bin/bash

cd $DRONE_WORKSPACE

PRONTO_PULL_REQUEST_ID=$PLUGIN_PR

# find the first commit of the commit branch which is not part of the repositories base branch
COMMIT=$(git log $DRONE_REPO_BRANCH..$DRONE_COMMIT_BRANCH --oneline | tail -1)

set

pronto run -f=$PLUGIN_FORMATTERS -r=$PLUGIN_RUNNER -c=$COMMIT $PLUGIN_ARGS
