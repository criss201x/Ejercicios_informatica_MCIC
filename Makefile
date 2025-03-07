PACKAGE_NAME=programacion

build:
	docker build -t $(PACKAGE_NAME) -f Dockerfile .
run:
	docker run -p 8889:8889 -v $(shell pwd):/app programacion
