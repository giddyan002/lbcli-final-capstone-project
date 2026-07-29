# what is the coinbase tx in this block 243,834
#!/bin/bash

# Get the block hash for height 243834 and extract the first transaction ID (coinbase)
block_hash=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockhash 243834)

bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock "$block_hash" | \
  jq -r '.tx[0]'