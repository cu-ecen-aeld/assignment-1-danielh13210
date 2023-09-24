#!/bin/bash
FILE="$1"
CONTENT="$2"
if [ -z "$FILE" ]; then
    echo "ERROR: FILE not specified" > /dev/stderr
    exit 1
fi
if [ -z "$CONTENT" ]; then
    echo "ERROR: CONTENT not specified" > /dev/stderr
    exit 1
fi
PARENT=$(dirname $FILE)
mkdir -p $PARENT
echo "$CONTENT" > $FILE
if [ ! -f "$FILE" ]; then
    exit 1
fi
echo "$CONTENT" > /tmp/expected
diff /tmp/expected "$FILE" && exit 1