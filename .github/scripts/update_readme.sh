#!/bin/bash
set -e

# Inputs
FREQ_RESULT="$1"
GITHUB_USER="$2"
TIMESTAMP=$(date -u '+%Y-%m-%d %H:%M:%S UTC')

# Update README with vowel frequency results
echo "" >> README.md
echo "### Vowel Frequency Analysis" >> README.md
echo "Contributor: ${GITHUB_USER}" >> README.md
echo "Results: ${FREQ_RESULT}" >> README.md
echo "Timestamp: ${TIMESTAMP}" >> README.md
