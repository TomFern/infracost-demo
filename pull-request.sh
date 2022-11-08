#!/usr/bin/env bash
# Run in CI env
# SEMAPHORE_GIT_SHA

if [[ "$SEMAPHORE_GIT_PROVIDER" == "github" ]]; then

# either --pull-request=$SEMAPHORE_GIT_PR_SHA or --commit=$SEMAPHORE_GIT_SHA
mkdir -p tmp
infracost breakdown --path . --format json --out-file tmp/infracost-base.json
infracost comment github --path=tmp/infracost-base.json \
                         --repo=$SEMAPHORE_GIT_REPO_SLUG \
                         --pull-request=$SEMAPHORE_GIT_PR_NUMBER \
                         --github-token=$GITHUB_API_KEY \
                         --behavior=update
fi

if [[ "$SEMAPHORE_GIT_PROVIDER" == "bitbucket" ]]; then
    true
fi
