# Which public key signed input 0 in this tx: d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7
#!/bin/bash

# Fetch and decode the transaction, then extract the public key from input 0's witness stack or scriptSig
bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getrawtransaction "d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7" 3 | \
  jq -r '.vin[0].txinwitness[1] // .vin[0].scriptSig.hex'