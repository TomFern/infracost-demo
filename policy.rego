# policy.rego

package infracost

deny[out] {

    # define a variable
	maxMonthlyCost = 1.0

	msg := sprintf(
		"Total monthly cost must be less than $%.2f (actual diff is $%.2f)",
		[maxMonthlyCost, to_number(input.totalMonthlyCost)],
	)

  	out := {
    	"msg": msg,
    	"failed": to_number(input.totalMonthlyCost) >= maxMonthlyCost
  	}
}