# Which tx in block 216,351 spends the coinbase output of block 216,128?
#!/bin/bash

# 1. Get coinbase txid of block 216128
hash_128=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockhash 216128)
coinbase_txid=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock "$hash_128" | jq -r '.tx[0]')

# 2. Get block hash of block 216351 and inspect its transactions to find which one spends the coinbase txid
hash_351=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockhash 216351)

bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock "$hash_351" 2 | \
  jq -r --arg target "$coinbase_txid" '.tx[] | select(.vin[].txid == $target) | .txid'