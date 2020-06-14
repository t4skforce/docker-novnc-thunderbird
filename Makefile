.PHONY: all clean build run

all: build run

clean:
	@echo "cleaning things"
	docker kill docker-novnc-thunderbird && echo "stopped container" || /bin/true
	docker rm docker-novnc-thunderbird && echo "removed container" || /bin/true
	docker rmi t4skforce/docker-novnc-thunderbird:latest && echo "removed container image" || /bin/true

build:
	@echo "building things"
	docker build -t t4skforce/docker-novnc-thunderbird:latest .

debug:
	@echo "debugging things"
	docker run --name docker-novnc-thunderbird -it -p 127.0.0.1:8080:8080/tcp -p 127.0.0.1:8443:8443/tcp -e REVERSE_PROXY=no -e APP_USERNAME=admin -e APP_PASSWORD=admin -v ~/Downloads:/data/Downloads:rw --rm t4skforce/docker-novnc-thunderbird:latest /bin/bash

run:
	@echo "runing things"
	docker run --name docker-novnc-thunderbird -it -p 127.0.0.1:8080:8080/tcp -p 127.0.0.1:8443:8443/tcp -e REVERSE_PROXY=no -e APP_USERNAME=admin -e APP_PASSWORD=admin -v ~/Downloads:/data/Downloads:rw --rm t4skforce/docker-novnc-thunderbird:latest
