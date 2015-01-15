#!bin/bash

set -e

function folders-with-changes {
	echo `git diff "$1"  --dirstat=lines`
}

function main {
	echo "changes in folders"

	folders-with-changes

	echo "Files Changed:"
}

main
