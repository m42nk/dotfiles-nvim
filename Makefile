.PHONY: build-run build-run-nvim build run run-no-volume run-nvim minimal
DOCKER_TAG ?=1.0.0

build-run: build run
build-run-nvim: build run-nvim

build:
	docker build -t dockerized-nvim:${DOCKER_TAG} .

run:
	docker run --rm \
    -v dockerized-nvim:${HOME}/.local/share/nvim \
		-v .:/home/${USERNAME}/.config/nvim \
		-it dockerized-nvim:${DOCKER_TAG}

run-no-volume:
	docker run --rm -it dockerized-nvim:${DOCKER_TAG}

run-nvim:
	docker run --rm \
		-v .:/home/${USERNAME}/.config/nvim \
    -v dockerized-nvim:${HOME}/.local/share/nvim \
		-it dockerized-nvim:${DOCKER_TAG} \
    nvim

minimal:
	@./local-nvim

# vim: set noexpandtab:
