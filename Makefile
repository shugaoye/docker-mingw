DOCKER = docker
IMAGE = shugaoye/mingw:latest
VOL1 ?= $(HOME)/vol1
VOL2 ?= $(HOME)/.ccache

dev: Dockerfile
	$(DOCKER) build -t $(IMAGE) .

test:
	./run_image.sh

all: dev

.PHONY: all
