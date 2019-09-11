#!/bin/bash
# kills and removes all running containers with names matching $1
echo "looking for docker containers containing $1"
declare -a lines
lines=(`docker container ps -f "name=$1" -q`)
echo "containers found:"
echo ${lines[@]}

# check if array is empty
if [ -z "$lines" ]
then
        echo "no containers matching string $1 found"
else
        echo "killing and removing ${#lines[@]} containers"
        # loop through array
        for u in "${lines[@]}"
        do
                echo "killing $u"
                docker kill "$u"
                echo "removing $u"
                docker rm "$u"
        done

fi