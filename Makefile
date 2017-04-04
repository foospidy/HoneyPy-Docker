PORTSMAP := $(shell touch ports.map; cat ports.map;)

build:
	./generate_dockerfile.sh
	docker build -t foospidy/honeypy:latest .

build-no-cache:
	./generate_dockerfile.sh
	docker build --no-cache -t foospidy/honeypy:latest .

build-debian:
	./generate_dockerfile.sh debian
	docker build -t foospidy/honeypy:latest .

build-debian-no-cache:
	./generate_dockerfile.sh debian
	docker build --no-cache -t foospidy/honeypy:latest .

run:
	docker run $(PORTSMAP) --rm -i -t foospidy/honeypy:latest /opt/HoneyPy/Honey.py

run-daemon:
	docker run $(PORTSMAP) -d foospidy/honeypy:latest /opt/HoneyPy/Honey.py -d

clean:
	# WARNING: this removes all docker images.
	docker stop $$(docker ps -a -q)
	docker rm $$(docker ps -a -q)
	docker rmi $$(docker images -f dangling=true -a)