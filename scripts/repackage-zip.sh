#!/bin/bash
# Repackage a zip file with cleaned folder names
# Removes spaces and special characters from FOLDER names only
# Files are left unchanged to preserve config references

set -e

if [[ -z "$1" ]]; then
    echo "Usage: $0 <input.zip> [output.zip]"
    echo ""
    echo "Repackages zip with cleaned FOLDER names:"
    echo "  - Spaces replaced with underscores"
    echo "  - Special characters (&, +, etc.) removed or replaced"
    echo "  - File names are NOT changed (preserves config references)"
    exit 1
fi

INPUT_ZIP="$1"
INPUT_NAME=$(basename "$INPUT_ZIP" .zip)
OUTPUT_ZIP="${2:-${INPUT_NAME}_cleaned.zip}"

if [[ ! -f "$INPUT_ZIP" ]]; then
    echo "ERROR: File not found: $INPUT_ZIP"
    exit 1
fi

WORK_DIR=$(mktemp -d)
echo "Work directory: $WORK_DIR"

# Extract
echo "Extracting $INPUT_ZIP..."
unzip -q "$INPUT_ZIP" -d "$WORK_DIR"

# Function to clean a name
clean_name() {
    echo "$1" | \
        sed 's/ /_/g' | \
        sed 's/&/and/g' | \
        sed 's/+/_/g' | \
        sed 's/__*/_/g' | \
        sed 's/_$//' | \
        sed 's/^_//'
}

# Rename FOLDERS only (deepest first)
echo "Cleaning folder names..."

find "$WORK_DIR" -depth -type d | while read -r dir; do
    base=$(basename "$dir")
    parent=$(dirname "$dir")
    cleaned=$(clean_name "$base")
    
    if [[ "$base" != "$cleaned" ]]; then
        echo "  Rename dir: $base -> $cleaned"
        mv "$dir" "$parent/$cleaned"
    fi
done

# Show new structure
echo ""
echo "New structure:"
find "$WORK_DIR" -type d | head -20

# Get the root folder name
ROOT_FOLDER=$(ls "$WORK_DIR")
echo ""
echo "Root folder: $ROOT_FOLDER"

# Create new zip in work dir first
echo ""
echo "Creating $OUTPUT_ZIP..."
(cd "$WORK_DIR" && zip -rq "../output.zip" "$ROOT_FOLDER")
mv "$WORK_DIR/../output.zip" "./$OUTPUT_ZIP"

# Verify
echo ""
echo "Contents of new zip:"
unzip -l "$OUTPUT_ZIP" | head -30

# Cleanup
rm -rf "$WORK_DIR"

echo ""
echo "Done: $OUTPUT_ZIP"
echo ""
echo "NOTE: File names unchanged. If folders were renamed, you may need to"
echo "update meters.txt/spectrum.txt folder references manually."
