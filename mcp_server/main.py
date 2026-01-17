import os
from fastapi import FastAPI, HTTPException
from openai import OpenAI
from dotenv import load_dotenv
import uvicorn

# --- Configuration ---
# Load environment variables from .env file
dotenv_path = os.path.join(os.path.dirname(__file__), '..', '.env')
load_dotenv(dotenv_path=dotenv_path)

# Get API key from environment, or prompt the user
# lmstudio doesn't require an api key, but we'll set it to a dummy value
API_KEY_NAME = "LMSTUDIO_API_KEY"
if os.getenv(API_KEY_NAME):
    api_key = os.getenv(API_KEY_NAME)
else:
    api_key = "lm-studio"
    with open(dotenv_path, "a") as f:
        f.write(f"{API_KEY_NAME}={api_key}\n")


# --- FastAPI App ---
app = FastAPI(
    title="Model Control Program Server",
    description="A server to interact with a local AI model running in lmstudio.",
    version="0.1.0",
)

# --- OpenAI Client ---
# lmstudio provides an OpenAI-compatible server
client = OpenAI(base_url="http://localhost:1234/v1", api_key=api_key)


# --- API Endpoints ---
@app.post("/chat")
async def chat(prompt: str):
    """
    Sends a prompt to the local AI model and returns the response.
    """
    if not prompt:
        raise HTTPException(status_code=400, detail="Prompt cannot be empty.")

    try:
        completion = client.chat.completions.create(
            model="local-model",  # This is a placeholder, lmstudio doesn't use it
            messages=[
                {"role": "system", "content": "You are a helpful coding assistant."},
                {"role": "user", "content": prompt},
            ],
            temperature=0.7,
        )
        return {"response": completion.choices[0].message.content}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/")
def read_root():
    return {"message": "MCP Server is running. Send a POST request to /chat with a 'prompt' to interact with the AI model."}


# --- Main Entry Point ---
if __name__ == "__main__":
    print("Starting MCP Server...")
    print("API Key loaded successfully.")
    print("Send a POST request to http://localhost:8000/chat with a JSON body like: {\"prompt\": \"Your prompt here\"}")
    uvicorn.run(app, host="0.0.0.0", port=8000)
