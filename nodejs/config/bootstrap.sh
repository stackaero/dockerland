#!/bin/bash -x

#default configure script set in dockerfile
#CONFIGURE_SCRIPT=/etc/supervisor/configure.sh

if [ -f /tmp/nodejs.conf ];
then
    cat /tmp/nodejs.conf \
  | sed "s|{{GIT_PROJECT}}|${GIT_PROJECT}|g" \
  > /etc/supervisor/conf.d/nodejs.conf
fi

if [ -f /etc/supervisor/startapp.sh.template ];
then
    cat /etc/supervisor/startapp.sh.template \
  | sed "s|{{GIT_PROJECT}}|${GIT_PROJECT}|g" \
  > /opt/apps/startapp.sh
  
  chmod +x /opt/apps/startapp.sh
fi

# run the git update
/etc/supervisor/gitupdate.sh

chown -R node:node /opt/apps
chown -R node:node /logs
    
# exec CMD
echo ">> exec docker CMD"
echo "$@"
"$@"

