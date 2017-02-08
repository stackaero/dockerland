#!/bin/bash -x



if [ -d /opt/apps/${GIT_PROJECT} ]
then
    echo "Project Directory exists.. backing up node_modules"  >> /logs/gitupdate.log
    mv /opt/apps/${GIT_PROJECT}/node_modules /opt/apps
    rm -rf /opt/apps/${GIT_PROJECT}
fi


if [ ! -z "${GIT_PROJECT_URL}" ]; then
    echo -e "************************************\nGIT ${GIT_PROJECT_URL}" `date` >> /logs/gitupdate.log
    cd /opt/apps
    echo "Cloning project $${GIT_PROJECT_URL} Branch:${GIT_BRANCH}" `date` >> /logs/gitupdate.log
    
    git config --global http.sslVerify false
    
    if [ -z "${GIT_BRANCH}" ]; then
        git clone --depth 1 ${GIT_PROJECT_URL}
    else
        git clone --depth 1 -b  "${GIT_BRANCH}" --single-branch ${GIT_PROJECT_URL}
    fi
    
    echo "Cloning completed ${GIT_PROJECT_URL}Branch:${GIT_BRANCH}" `date` >> /logs/gitupdate.log
    
    cd /opt/apps/${GIT_PROJECT}
    
    if [ -d /opt/apps/node_modules ]
    then
        echo "Restoring node_moudles folder" `date` >> /logs/gitupdate.log
        mv  /opt/apps/node_modules /opt/apps/${GIT_PROJECT}
    fi
    
    
    if [ ! -z "${NPM_ROOT_MODULES}" ]; then
      echo "Running npm" `date` >> /logs/gitupdate.log
      npm install -g ${NPM_ROOT_MODULES}
    fi
  
    echo "NPM Completed" `date` >> /logs/gitupdate.log
else
   echo "$GIT_TOKEN token not set" >> /logs/gitupdate.log
fi
