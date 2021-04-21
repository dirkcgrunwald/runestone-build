build:
	docker build -t runestone-build -f Dockerfile .

push:
	docker tag runestone-build:latest docker.io/dirkcgrunwald/runestone-build:latest
	docker push dirkcgrunwald/runestone-build:latest
