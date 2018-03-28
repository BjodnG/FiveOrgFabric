#!/bin/bash

#
echo "GENERATE ARTIFACTS"
#
~/FiveOrgFabric/cryptogen generate --config=./crypto-config.yaml

cd ~/FiveOrgFabric/
echo $PWD
export FABRIC_CFG_PATH=$PWD

./configtxgen -profile FiveOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block
export CHANNEL_NAME=mychannel
./configtxgen -profile FiveOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME
./configtxgen -profile FiveOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP
./configtxgen -profile FiveOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP
