#!/bin/bash

# Define paths
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BEEPER_DIR="$HOME/Library/Application Support/BeeperTexts"
CSS_FILE="custom.css"
REPO_CSS="$REPO_DIR/$CSS_FILE"
BEEPER_CSS="$BEEPER_DIR/$CSS_FILE"

# Check if custom.css exists in repository
if [ ! -f "$REPO_CSS" ]; then
    echo "Error: custom.css not found in repository. Please add it first."
    exit 1
fi

# Backup the original file if it exists and isn't already a symlink
if [ -f "$BEEPER_CSS" ] && [ ! -L "$BEEPER_CSS" ]; then
    mv "$BEEPER_CSS" "$BEEPER_CSS.bak"
    echo "Backed up original custom.css to custom.css.bak"
fi

# Create symlink
ln -sf "$REPO_CSS" "$BEEPER_CSS"
echo "Created symlink from repository to Beeper directory"

echo "Setup complete! Your custom.css is now managed by this repository." 
