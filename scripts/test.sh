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
echo "3. Checking index.html structure..."

if ! grep -qi "<html" index.html; then
    echo "FAIL: index.html does not contain <html>"
    exit 1
fi

if ! grep -qi "<head" index.html; then
    echo "FAIL: index.html does not contain <head>"
    exit 1
fi

if ! grep -qi "<body" index.html; then
    echo "FAIL: index.html does not contain <body>"
    exit 1
fi

if ! grep -qi "<title" index.html; then
    echo "FAIL: index.html does not contain <title>"
    exit 1
fi

echo "PASS: index.html has basic HTML structure."

echo
echo "4. Checking titles in all HTML pages..."

for file in "${required_files[@]}"; do
    if ! grep -qi "<title" "$file"; then
        echo "FAIL: $file does not contain a <title> tag"
        exit 1
    fi
done

echo "PASS: All HTML pages contain a title."

echo
echo "5. Checking JavaScript files..."

js_count=$(find js -type f -name "*.js" | wc -l)

if [ "$js_count" -eq 0 ]; then
    echo "FAIL: No JavaScript files found"
    exit 1
fi

echo "PASS: Found $js_count JavaScript files."

echo
echo "6. Checking CSS files..."

css_count=$(find css -type f -name "*.css" | wc -l)

if [ "$css_count" -eq 0 ]; then
    echo "FAIL: No CSS files found"
    exit 1
fi

echo "PASS: Found $css_count CSS files."

echo
echo "7. Checking important JavaScript files..."

required_js=(
    "auth.js"
    "home.js"
    "listing.js"
    "sell.js"
    "bought.js"
    "sold.js"
    "wishlist.js"
)

for file in "${required_js[@]}"; do
    if [ ! -f "js/$file" ]; then
        echo "FAIL: Missing JavaScript file: js/$file"
        exit 1
    fi
done

echo "PASS: All important JavaScript files exist."

echo
echo "8. Checking important CSS files..."

required_css=(
    "auth.css"
    "common.css"
    "home.css"
    "listing.css"
    "sell.css"
    "sold.css"
    "wishlist.css"
)

for file in "${required_css[@]}"; do
    if [ ! -f "css/$file" ]; then
        echo "FAIL: Missing CSS file: css/$file"
        exit 1
    fi
done

echo "PASS: All important CSS files exist."

echo
echo "9. Checking image directory..."

if [ ! -d "images" ]; then
    echo "FAIL: images directory missing"
    exit 1
fi

image_count=$(find images -type f | wc -l)

if [ "$image_count" -eq 0 ]; then
    echo "FAIL: No images found"
    exit 1
fi

echo "PASS: Found $image_count image files."


echo
echo "10. Checking README..."

if [ ! -f "README.md" ]; then
    echo "FAIL: README.md is missing"
    exit 1
fi

if [ ! -s "README.md" ]; then
    echo "FAIL: README.md is empty"
    exit 1
fi

echo "PASS: README.md exists and is not empty."

echo
echo "11. Checking .gitignore..."

if [ ! -f ".gitignore" ]; then
    echo "FAIL: .gitignore is missing"
    exit 1
fi

echo "PASS: .gitignore exists."

echo
echo "========================================"
echo "ALL PROJECT TESTS PASSED"
echo "========================================"