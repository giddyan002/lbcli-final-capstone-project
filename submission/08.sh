# what block height was this tx mined ?
# 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb
#!/bin/bash

# Fetch transaction details to get the blockhash where it was included, then fetch block info to get its height
blockhash=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getrawtransaction "49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb" 1 | jq -r '.blockhash')

bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock "$blockhash" | jq '.height'