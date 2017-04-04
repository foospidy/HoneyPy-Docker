# HoneyPy-Docker
Build a HoneyPy Docker Image

This is a quick and easy way to get up and running with HoneyPy. To learn more about HonePy see https://github.com/foospidy/HoneyPy/blob/master/README.md

## Instructions

### Configuration

To configure HoneyPy edit the `honeypy.cfg` and `service.cfg` files in the `etc` directory. 

### Creating the Container

__Alpine__

If you prefer running an Alpine Linux based container then run: `make build`

The Alpine container image ends up being about 200MB.

If you need to do a fresh rebuild run: `make build-no-cache`

__Debian__

If you prefer running a Debian Linux based container then run: `make build-debian`

The Debian container image ends up being about 344MB.

If you need to do a fresh rebuild run: `make build-debian-no-cache` 

Note, there is no difference in functionality between the Alpine or Debian builds.

### Usage

To run HoneyPy-Docker in interactive mode run: `make run`

To run HoneyPy-Docker in deamon mode run: `make run-daemon`
