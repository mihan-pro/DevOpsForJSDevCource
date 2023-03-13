#!bin/bash

declare -i result=0
for path in $@
do   
    count=$(find $path  -type f | wc -l)
    result+=$count
done

Echo There are $result files