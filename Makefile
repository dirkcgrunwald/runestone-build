

build-runestone-build:
	docker build -t runestone-build -f Dockerfile-build .

build-lti:
	docker build -t lti -f Dockerfile-lti .

run-lti:
	docker run --name lti --rm -it --net host --cap-add SYS_PTRACE lti 
