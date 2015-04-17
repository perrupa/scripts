#/bin/bash

git fetch > /dev/null &&    # update git and reroute output to null
git branches -a |           # list all branches
    grep "origin" |         # Get only remote branches
    grep remotes |          # Get only remote branches
    cut -c 18-              # Get from the 18th char onwards
