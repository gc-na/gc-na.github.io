#!/bin/bash

# This script removes any Git merge conflict markers from HTML files
echo "Fixing Git merge conflicts in HTML files..."

# Find all HTML files and process them
find . -name "*.html" -type f -exec sed -i '' \
    -e 's/<<<<<<< HEAD//g' \
    -e 's/=======//g' \
    -e 's/>>>>>>> [a-z0-9]\{40\}//g' \
    -e 's/c251f7a604e6c02b5f50cf9ee0070dae4b9//g' \
    {} \;

echo "Fixing HTML/CSS tags with poor contrast..."

# Update CSS to ensure high contrast
sed -i '' 's/background-color: rgba(14, 118, 168, 0.05);/background-color: #f0f7fb;/g' assets/css/custom.css
sed -i '' 's/color: rgba(0, 0, 0, 0.7);/color: #000000;/g' assets/css/custom.css

echo "Fixed!"
