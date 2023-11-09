USERNAME ?= m42nk
DOCKER_TAG ?=1.0.0

build-run: build run
build-run-nvim: build run-nvim

build:
	docker build -t dockerized-nvim:${DOCKER_TAG} .

run:
	docker run --rm \
    -v dockerized-nvim:/home/${USERNAME}/.local/share/nvim \
		-v .:/home/${USERNAME}/.config/nvim \
		-it dockerized-nvim:${DOCKER_TAG}

run-no-volume:
	docker run --rm -it dockerized-nvim:${DOCKER_TAG}

run-nvim:
	docker run --rm \
		-v .:/home/${USERNAME}/.config/nvim \
    -v dockerized-nvim:/home/${USERNAME}/.local/share/nvim \
		-it dockerized-nvim:${DOCKER_TAG} \
    nvim
