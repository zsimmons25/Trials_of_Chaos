# Trials_of_Chaos
 Guide for the Trials of Chaos game mode in Path of Exile 2 - Built with React, Express and Typescript

Create a compose.override.yaml file in the root directory with your mysql info:
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

Run docker commands

```
docker compose build
```

```
docker compose up
```