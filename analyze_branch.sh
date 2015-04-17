#!/bin/sh

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

# We're usually merging in to develop
base_branch="develop"
candidate_branch=$1
range="$base_branch..$candidate_branch"

log=$(pfa "git log $range --oneline")
diff=$(pfa "git diff $range --numstat")

echo "Commits:"
printf %s "$log" |
	awk '{print "   " $1}'

echo ""

echo "Jiras:"
printf %s "$log" |
	awk '{print "   " $2}' | get_jiras

echo ""

echo "Files Modified:"
printf %s "$diff" |
	awk '{printf "   +/- %-4s %s\n", $1+$2, $3 }'
