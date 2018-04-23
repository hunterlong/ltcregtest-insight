#!/bin/bash

rm -rf /data/bitcoin/regtest

litecoind -regtest -daemon --datadir=/data/bitcoin --conf=/data/bitcoin/bitcoin.conf

sleep 2

cd /data/bitcore/data

AUTH="-rpcuser=bitcoin -rpcpassword=password123"

litecoin-cli -regtest $AUTH getblockchaininfo

litecoin-cli -regtest $AUTH generate 110

litecoin-cli -regtest importprivkey "cVVGgzVgcc5S3owCskoneK8R1BNGkBveiEcGDaxu8RRDvFcaQaSG" "Account" false
litecoin-cli -regtest importprivkey "cRGkipHiYFRSAgdY9NjUT7egHTuNXoKYWQea3kWVbkSJAs4VDi8r" "Account" false
litecoin-cli -regtest importprivkey "cTc8XCQZuSt5E1LArqCxyaXhn1cQkvcBMAGQ159raPSQTuBpHWdi" "Account" false
litecoin-cli -regtest importprivkey "cQ9JwsoYHC2Md41uDbczDVpsuWAeYjDDrDiGbCBZ4stZhZvLZWj8" "Account" false
litecoin-cli -regtest importprivkey "cQrY4VypAuemJtHmNNJLyx1SNjY7mpfkdQEJpccpLSvan5YoMAkM" "Account" true

litecoin-cli -regtest $AUTH generate 1

litecoin-cli -regtest sendtoaddress "mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo" 10 "" "" true
litecoin-cli -regtest sendtoaddress "mzdF3oEx8mKrpGb5rVnTE7MhQfL8N8oSnW" 12 "" "" true
litecoin-cli -regtest sendtoaddress "mtdVMhiWWmegkkBhzYDrz84yfgofPNLNmb" 14 "" "" true
litecoin-cli -regtest sendtoaddress "mqNnZTyFxhB6EzF1iDEAp9enrT84fwd1X5" 17 "" "" true
litecoin-cli -regtest sendtoaddress "mnk2URqujBqMEfhALMby1WZHoBRauW37Kg" 20 "" "" true

blitecoin-cli -regtest $AUTH generate 1

litecoin-cli -regtest sendtoaddress "mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo" 1 "" "" true
litecoin-cli -regtest sendtoaddress "mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo" 2 "" "" true
litecoin-cli -regtest sendtoaddress "mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo" 3 "" "" true

blitecoin-cli -regtest $AUTH generate 1

litecoin-cli -regtest $AUTH getbalance

litecoin-cli -regtest $AUTH stop

sleep 1

screen -dms blocks /bin/bash -c "while true ; do litecoin-cli -regtest $AUTH generate 1 & sleep 5; done"

litecore-node start