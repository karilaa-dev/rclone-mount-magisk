#!/bin/bash

# Build script for rclone-mount Magisk module
# Creates a flashable ZIP file

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Extract version info from module.prop
MOD_VERSION=$(grep "^version=" module.prop | cut -d'=' -f2 | sed 's/.*mod: (v\([^)]*\)).*/\1/')
RCLONE_VERSION=$(grep "^version=" module.prop | cut -d'=' -f2 | sed 's/.*rclone: (v\([^)]*\)).*/\1/')
MOD_ID=$(grep "^id=" module.prop | cut -d'=' -f2)

OUTPUT_NAME="${MOD_ID}-v${MOD_VERSION}.zip"
OUTPUT_DIR="$SCRIPT_DIR/out"

echo "========================================"
echo "  Building Magisk Module"
echo "========================================"
echo "  Module ID:      $MOD_ID"
echo "  Module Version: v$MOD_VERSION"
echo "  Rclone Version: v$RCLONE_VERSION"
echo "  Output:         $OUTPUT_NAME"
echo "========================================"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Remove old build if exists
rm -f "$OUTPUT_DIR/$OUTPUT_NAME"

# Create ZIP with proper structure
# Exclude: git files, build artifacts, documentation, macOS files, build script itself
zip -r "$OUTPUT_DIR/$OUTPUT_NAME" . \
    -x "*.git*" \
    -x "*.gitignore" \
    -x "*.gitattributes" \
    -x "*.DS_Store" \
    -x "*.md" \
    -x "out/*" \
    -x "build.sh" \
    -x "*.zip" \
    -x "LICENSE*" \
    -x "*.txt" \
    -x "__MACOSX/*" \
    -x "*.log"

echo ""
echo "Build complete!"
echo "Output: $OUTPUT_DIR/$OUTPUT_NAME"
echo ""

# Show ZIP contents summary
echo "ZIP contents:"
unzip -l "$OUTPUT_DIR/$OUTPUT_NAME" | tail -1

# Show file size
ls -lh "$OUTPUT_DIR/$OUTPUT_NAME" | awk '{print "File size: " $5}'
