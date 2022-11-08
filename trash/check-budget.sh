#!/usr/bin/env bash
# 
# Checks that cloud monthly does not exceeed $MAX_MONTHLY_COST

set -eu

mkdir -p tmp
infracost breakdown --path . --format json --out-file tmp/infracost-base.json
monthly_cost=$(jq .projects[0].breakdown.totalMonthlyCost tmp/infracost-base.json | sed 's/"//g')
echo "Estimated montly cost is $ $monthly_cost "
if  (( $(echo "$monthly_cost > $MAX_MONTHLY_COST" | bc -l) )); then
    echo "ERROR: Estimated cost exceeds max allowed cost of $ $MAX_MONTHLY_COST"
    exit 1
fi