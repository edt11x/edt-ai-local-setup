# Local AI Setup

This project provides a simple way to set up and run a local AI model for coding tasks. It uses lmstudio to run the model and provides a simple Python server to interact with it.

## Setup

To get started, clone this repository and run the `setup_ai.sh` script:

```bash
git clone <repository-url>
cd <repository-name>
bash setup_ai.sh
```

The setup script will:

1.  Download lmstudio.
2.  Download a pre-selected AI model.
3.  Create a Python virtual environment.
4.  Install the required Python packages.

## Usage

1.  **Start lmstudio:** Run the downloaded lmstudio AppImage.
2.  **Load the model:** In lmstudio, load the downloaded model.
3.  **Start the local server:** In lmstudio, start the local server.
4.  **Start the MCP server:**
    ```bash
    source venv/bin/activate
    python mcp_server/main.py
    ```
5.  **Interact with the model:** You can now send requests to the MCP server.
