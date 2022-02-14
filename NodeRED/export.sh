#!/bin/bash

cmd=$1

case "$cmd" in

    --flows)
        rm -rf ~/.node-red/flows.json
        cp ./flows.json ~/.node-red/flows.json
        ;;

        --settings)
        rm -rf ~/.node-red/settings.json
        cp ./settings.json ~/.node-red/settings.json
        ;;

    *)
        echo "Unknown command '$cmd'"
        exit 1
        ;;

esac
