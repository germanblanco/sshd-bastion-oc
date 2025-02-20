#!/bin/bash

if [[ $EUID -eq 0 ]]
then
    /root_entrypoint.sh
else
    /tunneluser_entrypoint.sh
fi
