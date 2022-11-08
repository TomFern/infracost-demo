#!/usr/bin/env bash
# Run in CI env
# SEMAPHORE_GIT_SHA

if [[ "$SEMAPHORE_GIT_PROVIDER" == "github" ]]; then

# either --pull-request=$SEMAPHORE_GIT_PR_SHA or --commit=$SEMAPHORE_GIT_SHA
infracost comment github --path=infracost.json \
                         --repo=$SEMAPHORE_GIT_REPO_SLUG \
                         --pull-request=$SEMAPHORE_GIT_PR_SHA \
                         --github-token=$GITHUB_TOKEN \
                         --behavior=update
fi

if [[ "$SEMAPHORE_GIT_PROVIDER" == "bitbucket" ]]; then
    true
fi
