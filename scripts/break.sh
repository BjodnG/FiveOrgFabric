#!/bin/bash

echo
echo "    _      ____     ___     __     _      _     _    _  ____   ____  "
echo "   / \    |  _ \   / _ \   / _|   / \    | |    \\\  // |  __| |  __| "
echo "  / _ \   | |_) | / / \ \ / /    / _ \   | |     \\\//  |__ \  |  __| "
echo " / ___ \  |  _ /  \ \_/ / \ \   / ___ \  | |     / /    __| | | |__  "
echo "/_/   \_\ |_|      \___/   \__|/_/   \_\ |____| /_/    |____| |____| "
echo 
 

rm -R ~/.composer/
rm ~/FiveOrgFabric/*.card
rm -R ~/FiveOrgFabric/channel-artifacts/*
sudo rm -Rf ~/FiveOrgFabric/crypto-config/
rm -Rf ~/FiveOrgFabric/alice
rm -Rf ~/FiveOrgFabric/bob


cd ~/FiveOrgFabric/
docker-compose -f docker-compose-cli.yaml -f docker-compose-couch.yaml -f docker-compose-cas-template.yaml down
