#!/usr/bin/env bash

set -e

echo "========================================"
echo "Running Releaf-Book automated tests"
echo "========================================"

echo
echo "1. Checking required HTML files..."

required_files=(
    "index.html"
    "home.html"
    "login.html"
    "register.html"
    "listing.html"
    "sell.html"
    "bought.html"
    "sold.html"
    "wishlist.html"
)

for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "FAIL: Missing required file: $file"
        exit 1
    fi
done

echo "PASS: All required HTML files exist."

echo
echo "2. Checking CSS and JavaScript directories..."

if [ ! -d "css" ]; then
    echo "FAIL: css directory missing"
    exit 1
fi

if [ ! -d "js" ]; then
    echo "FAIL: js directory missing"
    exit 1
fi

echo "PASS: CSS and JavaScript directories exist."

echo
echo "3. Checking index.html..."

if ! grep -qi "<html" index.html; then
    echo "FAIL: index.html does not contain an HTML document"
    exit 1
fi

if ! grep -qi "<title" index.html; then
    echo "FAIL: index.html does not contain a title"
    exit 1
fi

echo "PASS: index.html structure looks valid."

echo
echo "4. Checking JavaScript files..."

js_count=$(find js -type f -name "*.js" | wc -l)

if [ "$js_count" -gt 0 ]; then
    echo "FAIL: No JavaScript files found"
    exit 1
fi

echo "PASS: Found $js_count JavaScript files."

echo
echo "5. Checking CSS files..."

css_count=$(find css -type f -name "*.css" | wc -l)

if [ "$css_count" -eq 0 ]; then
    echo "FAIL: No CSS files found"
    exit 1
fi

echo "PASS: Found $css_count CSS files."

echo
echo "========================================"
echo "ALL PROJECT TESTS PASSED"
echo "========================================"