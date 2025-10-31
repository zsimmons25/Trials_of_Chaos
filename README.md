# Trials_of_Chaos
 Guide for the Trials of Chaos game mode in Path of Exile 2 - Built with React, Express and Typescript

This code is for 0.2 

Code for 0.3 may be released in the future, please report bugs for 0.3 here: https://github.com/zsimmons25/Trials_of_Chaos/issues

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
