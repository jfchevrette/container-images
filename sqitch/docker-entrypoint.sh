#!/bin/sh
sqitch "$@"

# $LOCALUID, $LOCALGID are env variables set by docker run
if [ -n "$LOCALUID" -a -n "$LOCALGID" ]; then
  chown -R $LOCALUID:$LOCALGID /src
fi
