build-run br: build run
build-run-nvim brn: build run-nvim

build:
	docker build -t dockerized-nvim:latest .

run:
	docker run --rm \
		-v dockerized-nvim \
		-v .:/home/m42nk/.config/nvim \
		-it dockerized-nvim:latest $(arg)

run-no-volume:
	docker run --rm -it dockerized-nvim:latest $(arg)

run-nvim:
	docker run --rm \
		-v dockerized-nvim \
		-v .:/home/m42nk/.config/nvim \
		-it dockerized-nvim:latest \
    nvim
