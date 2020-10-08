DOCKER = docker
IMAGE = shugaoye/mingw:bionic-dev
VOL1 ?= $(HOME)/vol1
VOL2 ?= $(HOME)/.ccache

dev: Dockerfile
	$(DOCKER) build -t $(IMAGE) .

test:
	./run_image.sh $(IMAGE)

all: dev

.PHONY: all
