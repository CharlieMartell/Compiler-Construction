#!/bin/bash

## Script to test lexer results

LEXER=$1
DIFF=diff

if [ -z "$LEXER" ]; then
    echo "Usage: $0 <lexer_to_test>"
    exit
fi

echo "Testing lexer : ${LEXER}"
echo "***************************"
for f in *.test
do
    $LEXER "$f" > "${f%.test}.out"
    RES=$($DIFF "${f%.test}.out" "${f%.test}.std")
    if ! [ -z "$RES" ]; then
        echo "Mismatched output for ${f}:"
        echo "${RES}"
        echo "***************************"
    fi
    rm -f "${f%.test}.out"
done

echo "Done"
echo "(If you do not see diff results above, your output passes all tests!)"
