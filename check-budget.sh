#!/usr/bin/env bash
# 
# Checks monthly expending against $MAX_MONTHLY_COST

set -eu

mkdir -p tmp
infracost breakdown --path . --format json --out-file tmp/infracost-base.json
monthly_cost=$(jq .projects[0].breakdown.totalMonthlyCost tmp/infracost-base.json | sed 's/"//g')
if  (( $(echo "$monthly_cost > $MAX_MONTHLY_COST" | bc -l) )); then
    echo "ERROR: Maximum monthly cost of $ $MAX_MONTHLY_COST was exceeded"
    exit 1
fi