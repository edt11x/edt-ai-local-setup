#!/bin/bash

# Exit on error
set -e

MCP_SERVER_URL="http://localhost:8000/chat"
SAMPLE_PROMPT="Write a python function that returns the factorial of a number."

echo "Testing MCP server at $MCP_SERVER_URL"
echo "Sending prompt: '$SAMPLE_PROMPT'"

# Send the POST request
curl -X POST "$MCP_SERVER_URL" \
     -H "Content-Type: application/json" \
     -d "{\"prompt\": \"$SAMPLE_PROMPT\"}"

echo ""
echo "Test complete. Please check the output above for the server's response."
echo "Ensure that LM Studio is running with the model loaded and its local server started, and that mcp_server/main.py is also running."
