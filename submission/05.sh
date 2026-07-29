# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
#!/bin/bash

# Fetch raw transaction with verbosity 3 to directly read the fee field
bitcoin-cli -signet -rpcuser=btrustbuildersrpc -rpcpassword=btrustbuilderspass -rpcconnect=167.172.185.136 -rpcport=38332 getrawtransaction "b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb" 3 | \
  jq '.fee * 100000000 | round'