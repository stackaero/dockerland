#!/bin/bash -x


if [ -f /etc/supervisor/configure.sh ];
then
    echo "executing configur escript" > /tmp/bootstrap.log
    cat /etc/supervisor/configure.sh >> /tmp/bootstrap.log
   /etc/supervisor/configure.sh
else
   echo "/etc/supervisor/configure.sh does not exists" > /tmp/bootstrap.log
fi


# exec CMD
echo ">> exec docker CMD"
echo "$@"
"$@"

