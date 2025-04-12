#!/bin/bash

# Define paths
BEEPER_DIR="$HOME/Library/Application Support/BeeperTexts"
CSS_FILE="custom.css"
BEEPER_CSS="$BEEPER_DIR/$CSS_FILE"
BEEPER_CSS_BAK="$BEEPER_CSS.bak"

# Check if backup exists
if [ ! -f "$BEEPER_CSS_BAK" ]; then
    echo "Error: No backup file found at $BEEPER_CSS_BAK"
    exit 1
fi

# Remove symlink if it exists
if [ -L "$BEEPER_CSS" ]; then
    rm "$BEEPER_CSS"
    echo "Removed symlink"
fi

# Restore backup
mv "$BEEPER_CSS_BAK" "$BEEPER_CSS"
echo "Restored original custom.css from backup"

echo "Undo complete! Your custom.css has been restored to its original state." 
