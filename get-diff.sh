#!/bin/bash
code_directory="/dev-git/platform-a/"

branch_base="develop"
branch_candidate="HEAD"

function get_revisions()
{
	log=""
	(
		cd $code_directory

		# git log "$branch_base".."$branch_candidate"
		$log=`git log "$branch_base".."$branch_candidate"`
		# commits=`$log | awk "{print $1}"`
		# subjects=`$log | awk "{print $2}"`

	)
	for entry in $log; 
	do
		 echo $entry 
	done
}

get_revisions $branch_base $branch_candidate
