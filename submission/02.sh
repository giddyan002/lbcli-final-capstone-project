# How many new outputs were created by block 243,825?
#!/bin/bash

# Get the block hash for height 243825, fetch the block with full transaction details (verbosity 2), 
# and count all outputs (.vout) across all transactions (.tx) in that block.
block_hash=$(bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblockhash 243825)

bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getblock "$block_hash" 2 | \
  jq '[.tx[].vout | length] | add'