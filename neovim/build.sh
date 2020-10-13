#!/bin/bash

docker build \
    --rm \
    --tag "neovim:0.1" \
    .

docker run \
    --interactive \
    --tty \
    --rm \
    --name container1 \
    neovim:0.1
