#!/bin/bash
script_path="$(dirname "$0")"

R_IMAGE="ghcr.io/aridhia-open-source/r-base:4.5.0-$(cat .version)"

docker build "$script_path" -t "$R_IMAGE"
