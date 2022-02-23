#!/bin/bash

# Install Node-RED
bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)

# Replace settings
rm -rf ~/.node-red/settings.js
cp ./settings.js ~/.node-red/.
cp ./settings.json ~/.node-red/.

rm -rf ~/.node-red/flows.json
case "$1" in
    --water-supplier)
        cp ./flows.watersupplier.json ~/.node-red/flows.json
        ;;

    --feed-machine)
        cp ./flows.feedmachine.json ~/.node-red/flows.json
        ;;

esac

# Launch Node-RED on boot
sudo npm install -g pm2
pm2 start $(which node-red) -- -v
pm2 save
pm2 startup
sudo reboot
