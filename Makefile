PORTSMAP := $(shell touch ports.map; cat ports.map;)

build:
	./generate_dockerfile.sh
	docker build -t foospidy/honeypy:latest .

build-debian:
	./generate_dockerfile.sh debian
	docker build -t foospidy/honeypy:latest .

build-fresh:
	./generate_dockerfile.sh
	docker build --no-cache -t foospidy/honeypy:latest .

build-debian-fresh:
	./generate_dockerfile.sh debian
	docker build --no-cache -t foospidy/honeypy:latest .

run:
	docker run $(PORTSMAP) --rm -i -t foospidy/honeypy:latest /opt/HoneyPy/Honey.py

run-deamon:
	docker run $(PORTSMAP) -d foospidy/honeypy:latest /opt/HoneyPy/Honey.py -d

clean:
	# remove ports.map file
	@rm -f ports.map

	# stop and remove  container
	@if [ ! -z `docker ps | grep honeypy | awk '{print $$1}'` ]; \
	then \
		docker stop `docker ps | grep honeypy | awk '{print $$1}'`; \
		docker rm `docker ps -a | grep honeypy | awk '{print $$1}'`; \
	fi;

	# stop and remove lingering containers and images
	@for i in `docker images | grep \<none\> | awk '{print $$3}'`; \
	do \
		for c in `docker ps -a --filter=ansestor=$$i | grep -v CONTAINER | awk '{print $$1}'`; \
		do \
			docker stop $$c; \
			docker rm $$c; \
		done; \
		docker rmi $$i; \
	done;
