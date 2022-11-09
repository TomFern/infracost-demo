package Infracost

# max allowed monthly cost difference
deny[out] {
	# maxDiff defines the threshold that you require the cost estimate to be below.
	maxDiff = 500.0

	msg := sprintf(
		"Total monthly cost diff must be less than $%.2f (actual diff is $%.2f)",
		[maxDiff, to_number(input.diffTotalMonthlyCost)],
	)

	out := {
    	"msg": msg,
        # a boolean value that determines if this policy has failed.
    	"failed": to_number(input.diffTotalMonthlyCost) >= maxDiff
  	}
}

# max monthly budget
deny[out] {
	maxMontlyCost = 0.0

	msg := sprintf(
		"Total monthly cost must be less than $%.2f (actual is $%.2f)",
		[maxMontlyCost, to_number(input.totalMonthlyCost)],
	)

  	out := {
    	"msg": msg,
    	"failed": to_number(input.totalMonthlyCost) >= maxMontlyCost
  	}
}