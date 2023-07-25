build-run br: build run

build:
	docker build -t dockerized-nvim:latest .

run:
	docker run --rm \
		-v dockerized-nvim:/home/m42nk/.local/share/nvim \
		-v .:/home/m42nk/.config/nvim \
		-v ${HOME}/Codes:/home/m42nk/codes \
		-it dockerized-nvim:latest $(arg)

run-no-volume:
	docker run --rm -it dockerized-nvim:latest $(arg)

run-bash:
	docker run --rm -it dockerized-nvim:latest bash

speed:
	hyperfine "nvim --headless +qa init.lua"

speed-raw:
	hyperfine "nvim --headless +qa"

speed-log:
	nvim --startuptime startup.log +qa init.lua

