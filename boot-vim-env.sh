#!/bin/bash

docker build --tag vimenv:latest .
docker run -it -v "$(pwd)":/home/vimuser vimenv:latest
