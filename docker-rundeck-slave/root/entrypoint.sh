#!/bin/bash
#mkdir /root/.ssh
#cp /id_rsa /root/.ssh/
cp /ssh-config /root/.ssh/config
#chmod 700 /root/.ssh
#chmod 400 /root/.ssh/id_rsa
chmod 600 /root/.ssh/config



export ANSIBLE_FORCE_COLOR=true

mkdir workspace

git clone --recurse-submodules "${repository}" workspace
cd /workspace/

RD_OPTION_SELECT_BRANCH=${RD_OPTION_SELECT_BRANCH:-master} 
git checkout "${RD_OPTION_SELECT_BRANCH}"

bash -c " ${ansible} ${ansible_args}"

exit $?
