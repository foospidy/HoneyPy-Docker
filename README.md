# HoneyPy-Docker
Build HoneyPy Docker Images

To modify HoneyPy's configuration edit the two `.cfg` files in the etc directory. Then run `make build` to generate the Dockerfile and build the Docker image.

### Usage

Build the image: `make build`

Run the image in a contianer with an interactive console: `make run`

Run the image in a container as a deamon: `make run-deamon`

Clean up: `make clean`

### Networking

By default the `--net=host` parameter is used to expose connectivity to the host running the Docker container.
