# Dockerized Runestone

This repository contains a dockerfile that produces a container
to build and then serve a Runestone Interactive application.

## Building Runestone Interactive sites

The primary benefit of running the Runestone Interactive bulid system
within docker is not screwing up or adding to your local python setup
(virtualenv not withstanding).

A single container, **runestone-build**, is used to produced by
running `make build`. Once the container is build, you can create
a new, empty runestone interactive application by:

    % mkdir newproj  
    % docker run --rm runestone-build > runestone-build
    % sh runestone-build newproj

The first time you run the **runestone-build** container with no arguments,
it will emit a shell script that you should then use to create and/or build
your project. The shell script will determine your current user id and
insure that the files in your new or rebuilt project are owned by you.

The files in `./newproj` will be owned by a user other than you if you
invoke the container directly. Instead, it's recommended you use the
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
