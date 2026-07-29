# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
#!/bin/bash

# Get block hash for height 243821, fetch the block with transactions, and find the tx with sequence < 0xfffffffe
block_hash=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockhash 243821)

bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock "$block_hash" 2 | \
  jq -r '.tx[] | select(.vin[].sequence < 4294967294) | .txid'