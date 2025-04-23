# Trials_of_Chaos
 Guide for the Trials of Chaos game mode in Path of Exile 2 - Built with React, Express and Typescript

Create a compose.override.yaml file in the root directory with your desired mysql password:
```
version: '3.8'

services:
  backend:
    environment:
      - MYSQL_PASSWORD=

  mysql:
    environment:
      - MYSQL_ROOT_PASSWORD=
```

Run docker commands:

```
docker compose build
```

```
docker compose up
```

Alternatively run the modifiers.sql schema with your mysql service, install nginx, then open 2 terminals for frontend and backend, enter each directory and run:

```
pnpm install && pnpm docker:start
```

For running in a VS Code dev container - use compose.dev.yaml, select frontend, node, mysql and use the following devcontainer.json:
```
{
	"name": "Trials of Chaos Dev Environment",
	"dockerComposeFile": ["../compose.dev.yaml"],
	"service": "frontend",
	"workspaceFolder": "/workspace",
	"customizations": {
	  "vscode": {
		"extensions": [
		  "dbaeumer.vscode-eslint",
		  "esbenp.prettier-vscode",
		  "ms-vscode.vscode-typescript-next",
		  "bradlc.vscode-tailwindcss"
		],
		"settings": {
		  "terminal.integrated.defaultProfile.linux": "bash",
		  "typescript.tsdk": "/workspace/Trials_of_Chaos/node_modules/typescript/lib",
		  "editor.formatOnSave": true,
		  "editor.defaultFormatter": "esbenp.prettier-vscode",
		  "files.watcherExclude": {
			"**/node_modules/**": true
		  },
		  "files.exclude": {},
		  "explorer.autoReveal": true,
		  "explorer.compactFolders": false
		}
	  }
	},
	"remoteUser": "root",
	"forwardPorts": [5173, 3500],
	"portsAttributes": {
		"5173": {
			"label": "Frontend",
			"onAutoForward": "notify",
			"protocol": "http",
			"hostName": "localhost"
		},
		"3500": {
			"label": "Backend API",
			"onAutoForward": "notify",
			"protocol": "http",
			"hostName": "localhost"
		}
	},
	"overrideCommand": false,
	"postCreateCommand": "echo '{\"folders\":[{\"path\":\"/workspace\"}]}' > /root/trials-of-chaos.code-workspace"
  }
```

When the dev container starts open `/workspace/` created by the devcontainer.json