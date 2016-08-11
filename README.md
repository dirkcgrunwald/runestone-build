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
    docker run -it --rm -v $(pwd)/newproj:/opt -p 8000:8000 runestone-build

This maps `./newproj` to the `/opt` directory and then starts the process
of creating a new project. You'll be asked a number of questions, which is
why you should use the `-it` option to run the container interactively.

The files in `./newproj` will be owned by a user other than you if you
invoke the container this way. Instead, it's recommended you use the
`runestone-build` script, which passes arguments to the the container
to create a user with your UID and then run the container as that user.
Thus, you would do:

    mkdir newproj
    ./runestone-build newproj

to build your project. Once you've created your project want to see the
results, simply run

    ./runestone-build newproj

again and the `runestone build` process will be run followed by
`runestone serve`, which will forward the containers websrver
to port 8000 on your local machine. If you want to change the port,
edit the ./runestone-build script in the obvious place.

When you're done running the server, just hit Ctrl-c to kill the
container.
