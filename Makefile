.PHONY: test

all: mod run

run:
	hugo server --minify --theme reveal-hugo

# Suggest bind 0.0.0.0 for wls network.
wls win windows:
	hugo server --bind=0.0.0.0 --port=1313 --minify --theme reveal-hugo

mod:
	git init -b main
	git submodule add --force https://github.com/dzello/reveal-hugo.git themes/reveal-hugo
	git submodule update --init
	git submodule update --remote

	git add .
	git commit -m "init project" | true

build:
	hugo -D --minify
	
install:
	git submodule update --init
	git submodule update --remote
	hugo -D --minify
