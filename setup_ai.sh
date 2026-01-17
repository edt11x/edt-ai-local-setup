#!/bin/bash

# Exit on error
set -e

# --- Configuration ---
LMSTUDIO_URL="https://installers.lmstudio.ai/linux/x64/0.3.15-11/LM-Studio-0.3.15-11-x64.AppImage"
LMSTUDIO_APPIMAGE="LM-Studio-0.3.15-11-x64.AppImage"
MODEL_URL="https://huggingface.co/TheBloke/CodeLlama-7B-Instruct-GGUF/resolve/main/codellama-7b-instruct.Q4_K_M.gguf"
MODEL_FILENAME="codellama-7b-instruct.Q4_K_M.gguf"
MODEL_DIR="models"
VENV_DIR="venv"

# --- Helper Functions ---
function print_info {
    echo "INFO: $1"
}

function print_error {
    echo "ERROR: $1" >&2
    exit 1
}

# --- Main Setup ---

# 1. Download lmstudio
if [ -f "$LMSTUDIO_APPIMAGE" ]; then
    print_info "lmstudio AppImage already downloaded."
else
    print_info "Downloading lmstudio..."
    if ! wget -O "$LMSTUDIO_APPIMAGE" "$LMSTUDIO_URL"; then
        print_error "Failed to download lmstudio. Please check the URL or your network connection."
    fi
    chmod +x "$LMSTUDIO_APPIMAGE"
    print_info "lmstudio downloaded and made executable."
fi

# 2. Download the AI model
mkdir -p "$MODEL_DIR"
if [ -f "$MODEL_DIR/$MODEL_FILENAME" ]; then
    print_info "AI model already downloaded."
else
    print_info "Downloading AI model..."
    if ! wget -O "$MODEL_DIR/$MODEL_FILENAME" "$MODEL_URL"; then
        print_error "Failed to download the AI model. Please check the URL or your network connection."
    fi
    print_info "AI model downloaded."
fi

# 3. Set up Python environment
print_info "Setting up Python environment..."
if ! ./setup_python.sh; then
    print_error "Python setup failed. Please check 'setup_python.sh' and your Python installation."
fi
print_info "Python environment setup complete."

# --- exa Installation Check ---
if ! command -v exa &> /dev/null; then
    print_info "---"
    print_info "For a better directory listing experience, consider installing 'exa'."
    print_info "Installation instructions can be found at: https://github.com/ogham/exa"
    print_info "---"
else
    print_info "Using 'exa' for directory listing."
    exa -T
fi


print_info "Setup complete!"
print_info "Next steps:"
print_info "1. Run './$LMSTUDIO_APPIMAGE' to start lmstudio."
print_info "2. In lmstudio, navigate to the 'My Models' tab and load the model from the '$MODEL_DIR' directory."
print_info "3. Navigate to the 'Local Server' tab and click 'Start Server'."
print_info "4. In a new terminal, run the following commands to start the MCP server:"
print_info "   source $VENV_DIR/bin/activate"
print_info "   python mcp_server/main.py"
