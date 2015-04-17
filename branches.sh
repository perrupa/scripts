branches=(
	feature/soa-logging
	feature/language-deprecation
	feature/bohr-locale-final-cleanup
	feature/develop-soa-additions
	feature/vagrant-grunt-commands
	feature/namespace_trait
)

for branch in "${branches[@]}"; do
	log_file="analysis/${branch/\//}.txt"
	touch $log_file
	sh ./analyze_branch.sh $branch > $log_file
done
