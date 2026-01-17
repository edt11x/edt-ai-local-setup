#!/bin/bash
set -e

VENV_DIR="venv"

if [ ! -d "$VENV_DIR" ]; then
    echo "Creating Python virtual environment."
    python3 -m venv "$VENV_DIR"
else
    echo "Python virtual environment already exists."
fi

echo "Installing/updating Python dependencies..."
"$VENV_DIR/bin/pip" install -r mcp_server/requirements.txt

echo "Python setup complete."
