#!/bin/bash
set -e

HTML_FILE="index.html"

# Extract tasks and test results
TODO_TASKS=$(sed -n '/^ToDo Tasks:/,/^Done Tasks:/p' "$1" | sed '1d;$d' | sed '/^$/d')
DONE_TASKS=$(sed -n '/^Done Tasks:/,$p' "$1" | sed '1d' | sed '/^$/d')
UNIT_TEST_RESULTS=$(cat "$2")

# Update a specific pre tag using its ID
update_pre() {
    local id="$1"
    local content="$2"
    local file="$3"

    CONTENT="$content" perl -0777 -i -pe \
        'BEGIN { $content = $ENV{"CONTENT"}; } s{(<pre id="\Q'"$id"'\E">).*?(</pre>)}{$1$content$2}sg' \
        "$file"
}

# Update the HTML sections
update_pre "pending" "$TODO_TASKS" "$HTML_FILE"
update_pre "completed" "$DONE_TASKS" "$HTML_FILE"
update_pre "unittest" "$UNIT_TEST_RESULTS" "$HTML_FILE"

echo "index.html updated successfully!"
