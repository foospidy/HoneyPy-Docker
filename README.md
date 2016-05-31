# HoneyPy-Docker
Build a HoneyPy Docker Image

To modify HoneyPy's configuration edit the two `.cfg` files in the etc directory. Then run `make build` to generate the Dockerfile and build the Docker image. For more details about HonePy see https://github.com/foospidy/HoneyPy/blob/master/README.md

You can also find an image on hub.docker.com here: https://hub.docker.com/r/foospidy/honeypy/

### Usage

Build the image: `make build`

Build a completely fresh image: `make build-fresh`

Run the image in a contianer with an interactive console: `make run`

Run the image in a container as a deamon: `make run-deamon`

Clean up: `make clean`
