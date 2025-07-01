#!/bin/bash
script_path="$(dirname "$0")"

PYTHON_IMAGE=ghcr.io/aridhia-open-source/python-base:$(cat .version)

docker build "$script_path" -t "$PYTHON_IMAGE"
