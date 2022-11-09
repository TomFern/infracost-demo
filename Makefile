costs:
	infracost breakdown --config-file infracost.yml --format json --out-file infra/infracost-base.json
	infracost breakdown --config-file infracost.yml --format html --out-file infra/infracost-base.html

diff:
	infracost diff --config-file infracost.yml --format json --compare-to infra/infracost-base.json --out-file infra/infracost-diff.json