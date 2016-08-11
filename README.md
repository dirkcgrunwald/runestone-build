# Dockerized Runestone

This repository contains two dockerfiles that produce containers to
build and then serve a Runestone Interactive application and also
to build the "Runestone Server" that is used to record student data.

## Building Runestone Interactive sites

The primary benefit of running the Runestone Interactive bulid system
within docker is not screwing up or adding to your local python setup
(virtualenv not withstanding).

A single container, **runestone-build**, is used to produced by
running `make build`. Once the container is build, you can create
a new, empty runestone interactive application by:

  mkdir newproj  
  docker run -it --rm -v $(pwd)/newproj:/opt -p 8080:8080 runestone-build

This maps `./newproj` to the `/opt` directory and then starts the process
of creating a new project. You'll be asked a number of questions, which is
why you should use the `-it` option to run the container interactively.
