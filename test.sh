#!bin/sh
base_branch="develop"
candidate_branch=$1

function get_jiras {
	jira_pattern="[A-z]\{1,\}\-[0-9]\{1,\}"
	grep "$jira_pattern"
}

function pfa {
	pfa_directory="/dev-git/platform-a/"
	command=$1

	# Enter PFA scope to execute command
	(
		cd $pfa_directory
		$command
	)
}

log=$(pfa "git log $base_branch...$candidate_branch --oneline") 


echo "Commits:"
printf %s "$log" | 
	awk '{print "   "$1}'

echo ""

echo "Jiras:"
printf %s "$log" | 
	awk '{print "   "$2}' | get_jiras
