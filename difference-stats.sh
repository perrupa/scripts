#!bin/bash

set -e

changeset="$1"
changeset="$1"

echo "Files changed in directories"
git diff $changeset --dirstat=lines | cat


echo "Files changed"
git diff $changeset --stat | grep "|" |  awk '{ printf "%-4s -   %s\n", $3, $1 }' 
