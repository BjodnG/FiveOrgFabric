
#!/bin/bash


echo "Create admin cards:"

composer card create -p connection-org1-only.json -u PeerAdmin -c ./crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem -k ./crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/*_sk -r PeerAdmin -r ChannelAdmin



composer card create -p connection-org1.json -u PeerAdmin -c ./crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem -k ./crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/*_sk -r PeerAdmin -r ChannelAdmin

composer card create -p connection-org2-only.json -u PeerAdmin -c ./crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts/Admin@org2.example.com-cert.pem -k ./crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/*_sk -r PeerAdmin -r ChannelAdmin



composer card create -p connection-org2.json -u PeerAdmin -c ./crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts/Admin@org2.example.com-cert.pem -k ./crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/*_sk -r PeerAdmin -r ChannelAdmin

echo "Import admin cards:"

composer card import -f PeerAdmin@byfn-network-org1-only.card

composer card import -f PeerAdmin@byfn-network-org1.card

composer card import -f PeerAdmin@byfn-network-org2-only.card

composer card import -f PeerAdmin@byfn-network-org2.card

composer card list
sleep 3


echo "Import admin cards:"

composer runtime install -c PeerAdmin@byfn-network-org1-only -n altinn-network

composer runtime install -c PeerAdmin@byfn-network-org2-only -n altinn-network

sleep 2


composer identity request -c PeerAdmin@byfn-network-org1-only -u admin -s adminpw -d alice


composer identity request -c PeerAdmin@byfn-network-org2-only -u admin -s adminpw -d bob

sleep 1

composer network start -c PeerAdmin@byfn-network-org1 -a altinn-network/altinn-network@0.0.1.bna -o endorsementPolicyFile=endorsement-policy.json -A alice -C alice/admin-pub.pem -A bob -C bob/admin-pub.pem

#composer network start -c PeerAdmin@byfn-network-org1 -a altinn-network/altinn-network@0.0.1.bna -o #endorsementPolicyFile=endorsement-policy.json -A alice -C alice/admin-pub.pem -A bob -C bob/admin-pub.pem


#composer card create -p connection-org1.json -u alice -n tutorial-network -c alice/admin-pub.pem -k alice/admin-priv.pem

#composer card import -f alice@tutorial-network.card
