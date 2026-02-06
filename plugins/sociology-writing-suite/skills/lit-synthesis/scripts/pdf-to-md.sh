#!/bin/bash
# Convert PDF to Markdown using docling (with caching)
# Usage: ./pdf-to-md.sh <pdf_path>
#
# Outputs markdown to the same folder as the PDF.
# If markdown already exists, skips conversion and returns existing file.

set -e

PDF_PATH="$1"

if [ -z "$PDF_PATH" ]; then
    echo "Usage: $0 <pdf_path>"
    exit 1
fi

if [ ! -f "$PDF_PATH" ]; then
    echo "Error: File not found: $PDF_PATH"
    exit 1
fi

# Get the directory and basename
PDF_DIR=$(dirname "$PDF_PATH")
BASENAME=$(basename "$PDF_PATH" .pdf)
MD_FILE="$PDF_DIR/$BASENAME.md"

# Check if markdown already exists (cache hit)
if [ -f "$MD_FILE" ]; then
    echo "$MD_FILE"
    exit 0
fi

# Convert with docling (cache miss)
/Users/nealcaren/.local/bin/docling "$PDF_PATH" \
    --to md \
    --image-export-mode placeholder \
    --output "$PDF_DIR" 2>/dev/null

# Verify output
if [ -f "$MD_FILE" ]; then
    echo "$MD_FILE"
else
    echo "Error: Markdown file not created"
    exit 1
fi
