# Federated-Node-Task-Base-Images
A collection of docker images to be used as base for analytics to be run on a Federated Node

### Python Base image

It is found in the [python](./python) folder. Run the build script inside it to create a copy locally

### R Base image

It is found in the [R](./R) folder. Run the build script inside it to create a copy locally

## Registry
Both images can be found at `ghcr.io/aridhia-open-source/r-base` and `ghcr.io/aridhia-open-source/python-base`

## How to use them
In order to used them, start your Dockerfile as follows:
```Dockerfile
FROM ghcr.io/aridhia-open-source/r-base:0.0.1
```
make sure the tag is the correct one.

On top of that, add your scripts or folders with
```Dockerfile
ADD <source path> <destination path>
# e.g.
ADD script/analysis/start.py /app/
# This will create a copy of your local start.py file in the /app/start.py path
```
and to automatically run your script
```Dockerfile
ENTRYPOINT ["python3", "<script path>"]
#e.g.
ENTRYPOINT ["python3", "/app/start.py"]
```
