#!/bin/bash

INPUT="torrents.state"
OUTPUT="torrents.csv"

awk '
BEGIN {
    print "\"Name\",\"Hash\",\"Path\""
}

# Name
/^asg18$/ {
    if (getline line > 0) {
        if (match(line, /^S'\''([^'\'']*)'\''$/, m))
            name = m[1]
    }
    next
}

# Hash
/^sg25$/ {
    if (getline line > 0) {
        if (match(line, /^S'\''([^'\'']*)'\''$/, m))
            hash = m[1]
    }
    next
}

# Path
/^sg21$/ {
    if (getline line > 0) {
        if (match(line, /^S'\''([^'\'']*)'\''$/, m))
            path = m[1]
    }

    # Once all three have been found, output one row
    if (name != "" && hash != "" && path != "") {
        printf "\"%s\",\"%s\",\"%s\"\n", name, hash, path

        name = ""
        hash = ""
        path = ""
    }

    next
}
' "$INPUT" > "$OUTPUT"

echo "Finished: $OUTPUT"
