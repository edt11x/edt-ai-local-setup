
* I want to create a project, where the main outcome is there is a setup_ai.sh that can be run to download a model and run this application.
* Python can be used instead of Bash if that is appropriate.
* The AI model is going to be run locally with lmstudio, I want setup_ai.sh to download lmstudio as part of its setup
* I want to be able to clone this project from a Github repository and run setup_ai.sh to bring up all the components
* I want a small selection of models that are well recognized that can run on reasonbly desktop or laptop computers run recent x86_64 based Linux distributions, such as Fedora 42.
* I want to pick models that are reasonable at coding tasks.
* I want a setup of a locally running MCP server in Python that can interface with the module
* I want Python to use requirements.txt and a venv environment
* I don't want to store the model on Github, I want it to be downloaded from the setup_ai.sh script if the selected model is not present on the computer.
* I don't want to re-download the model if it's already present.
* I have Huggingface and Openrouter subscriptions if that is useful.
* I would like the project to use "exa".
* I don't want any necessary API keys stored in the project. The project should prompt if it has not stored the API keys locally.
* API keys should be stored securely and not transmitted to Github.
