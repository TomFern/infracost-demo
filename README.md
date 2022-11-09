# Estimate cloud costs with Semaphore CI/CD

This demo uses [Infracost](https://infracost.io) to estimate cloud costs based on Terraform config files.

## Using this demo

1. Fork the repository.
2. Add it to [Semaphore CI](https://semaphoreci.com)
3. Use the existing pipeline configuration
4. Change a Terraform file

The following actions are demoed:
- Commits where Terraform files are changed get a comment.
- Pull requests that change Terraform files are commented with the cost difference.
- The pipeline stops with error if estimated cost exceeds budget, preventing deployments.

- **Updating cost analysis**: `make costs`
- **Calculating diffs in costs**: `make diff`

## Prerequisites

1. Signup for [Infracost](https://infracost.io) with a free account.
2. Signup for [Semaphore CI](https://semaphoreci.com) with a free account.
3. Get your Infracost API Key
4. Get a classic GitHub API Key with write access.
3. Add a Semaphore Secret called `infracost` with two values. For GitHub
    - INFRACOST_API_KEY = YOUR API KEY
    - GITHUB_API_KEY = YOUR API KEY
