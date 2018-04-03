#!/bin/bash
 

rm -R ~/.composer/
rm ~/FiveOrgFabric/*.card
rm -R ~/FiveOrgFabric/channel-artifacts/*
sudo rm -Rf ~/FiveOrgFabric/crypto-config/
rm -Rf ~/FiveOrgFabric/alice
rm -Rf ~/FiveOrgFabric/bob


cd ~/FiveOrgFabric/
docker-compose -f docker-compose-cli.yaml -f docker-compose-couch.yaml -f docker-compose-cas-template.yaml down
