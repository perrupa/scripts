#!bin/sh
base_branch="develop"
candidate_branch=$1


function pfa {
	pfa_directory="/dev-git/platform-a/"
	command=$1

	# Enter PFA scope to execute command
	(
		cd $pfa_directory
		$command
	)
}

pfa "git log $base_branch...$candidate_branch --oneline"