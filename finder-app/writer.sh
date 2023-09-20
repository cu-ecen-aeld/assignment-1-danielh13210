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
if [ ! ( -f "$FILE" ) ]; then
    touch "$FILE"
    if [ ! ( -f "$FILE" ) ]; then
        exit 1
    fi
fi
echo "$CONTENT" > "$FILE"
echo "$CONTENT" > /tmp/expected
diff /tmp/expected "$FILE" && exit 1