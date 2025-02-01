#!/bin/bash

IMAGE_DIR="$HOME/.config/backgrounds/"

IMAGE=$(ls $IMAGE_DIR | shuf -n 1)

swaylock -c 000000 -e --image $IMAGE_DIR$IMAGE
