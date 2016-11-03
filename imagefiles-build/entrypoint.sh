#!/bin/sh

#
# Either create or build and then (optionally) serve content

USER_ID=${LOCAL_USER_ID:-9001}

if [ "$USER_ID" -eq 9001 ]; then
   cat /run/runestone-build
else
   echo "Starting with UID : $USER_ID"
   useradd --shell /bin/bash -d /opt -u $USER_ID -o -c "" -m user > /dev/null 2> /dev/null
   export HOME=/opt

   cd /opt
   chown -R user .

   if ! test -f /opt/conf.py
   then
      exec /usr/local/bin/gosu user /usr/local/bin/runestone init
   else
      /usr/local/bin/gosu user /usr/local/bin/runestone build
      exec /usr/local/bin/gosu user /usr/local/bin/runestone serve
   fi
fi


