#!/bin/bash

#
echo "BUILD NETWORK"

docker-compose -f docker-compose-cli.yaml  -f docker-compose-couch.yaml -f docker-compose-cas.yaml up -d
#docker-compose -f docker-compose-e2e-template.yaml -f docker-compose-couch.yaml up -d
#
echo "CREATE CHANNEL AND JOIN PEERS"
#

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
CORE_PEER_ADDRESS=peer0.org1.example.com:7051
CORE_PEER_LOCALMSPID="Org1MSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt

docker exec -it cli bash
