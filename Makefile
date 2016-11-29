name = im2txt_demo 

build:
	docker build . -t $(name)

stop:
	docker rm -f $(name) || true

run: stop
	docker run -it --rm=true -p 8888:8888 -v $(shell pwd):/root --name=$(name) $(name) bash -l
start: stop
	docker run -it --rm=true -p 8888:8888 -v $(shell pwd):/root --name=$(name) $(name) run_jupyter.sh -l
