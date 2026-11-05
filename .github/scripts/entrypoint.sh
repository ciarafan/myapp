#!/bin/bash
set -e

echo "Starting Frequency Analyzer..."

# Use the GitHub Actions workspace when available
if [ -d "/github/workspace" ]; then
    WORKSPACE="/github/workspace"
else
    WORKSPACE="/app"
fi

cd "$WORKSPACE"

# Run the Python vowel frequency analyser
FREQ_RESULT=$(python3 "$WORKSPACE/.github/scripts/frequency.py" "$WORKSPACE/${FILE:-data.txt}")

# Update the README with the results and GitHub username
bash "$WORKSPACE/.github/scripts/update_readme.sh" "$FREQ_RESULT" "$GITHUB_USER"

echo "Process Complete!"
