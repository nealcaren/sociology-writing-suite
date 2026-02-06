#!/bin/bash
# Read a PDF paper and convert to markdown for analysis
# Usage: ./read-paper.sh <pdf_path>
#
# Markdown is saved alongside the PDF for reuse.
# If markdown already exists, uses cached version.

set -e

PDF_PATH="$1"

if [ -z "$PDF_PATH" ]; then
    echo "Usage: $0 <pdf_path>"
    echo ""
    echo "Converts PDF to markdown (cached alongside PDF)."
    echo "Use with Claude's haiku reading agent for structured notes."
    exit 1
fi

if [ ! -f "$PDF_PATH" ]; then
    echo "Error: File not found: $PDF_PATH"
    exit 1
fi

# Get paths
PDF_DIR=$(dirname "$PDF_PATH")
BASENAME=$(basename "$PDF_PATH" .pdf)
MD_FILE="$PDF_DIR/$BASENAME.md"

# Check cache
if [ -f "$MD_FILE" ]; then
    echo "Using cached: $MD_FILE"
else
    echo "Converting: $BASENAME"
    docling "$PDF_PATH" \
        --to md \
        --image-export-mode placeholder \
        --output "$PDF_DIR" 2>/dev/null

    if [ -f "$MD_FILE" ]; then
        echo "Created: $MD_FILE"
    else
        echo "Error: Conversion failed"
        exit 1
    fi
fi

echo ""
echo "Ready for reading agent."
