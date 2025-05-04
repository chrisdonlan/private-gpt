# control recipes
.FORCE:


# vars
PGPT_TAG?=$(shell cat version.txt)
PGPT_IMAGE?=zylonai/private-gpt


# wildcard recipes
.PHONY:
docker-build-%: .FORCE
	docker build -f Dockerfile.$* . -t $(PGPT_IMAGE):$(PGPT_TAG)-$*


# hard recipes


# composites
.PHONY:
docker-build: docker-build-ollama docker-build-llamacpp-cpu
