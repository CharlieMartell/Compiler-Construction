#!/bin/bash

## Script to test cgen-1 results

DIFF=diff

echo "Testing cgen-1"
echo "***************************"
for f in *.cl
do
    RES=$($DIFF "${f%.cl}.out" "${f%.cl}.refout")
    if ! [ -z "$RES" ]; then
        echo "Mismatched output for ${f}:"
        echo "${RES}"
        echo "***************************"
    fi
done

echo "Done"
echo "(If you do not see diff results above, your output passes all tests!)"
