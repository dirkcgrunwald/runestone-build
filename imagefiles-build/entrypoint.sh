#!/bin/sh

#
# Either create or build and then (optionally) serve content

if ! test -f /opt/conf.py
then
    cd /opt
    runestone init
else
    cd /opt
    runestone build && runestone serve
fi


