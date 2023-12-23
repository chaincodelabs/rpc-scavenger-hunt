# RPC Scavenger Hunt

These exercises require a synced mainnet full node with the transaction index
active (`-txindex=1`). Chaincode Labs can provide credentials to a hosted node
with an authenticated [proxy](https://github.com/pinheadmz/rpc-auth-proxy)
so students can complete the exercises using `bitcoin-cli` locally but without
needing to sync a full node themselves. To use the proxy you must have `bitcoin-cli`
installed. It is part of the package you can download from [bitcoincore.org](https://bitcoincore.org/bin/bitcoin-core-26.0/).
These packages obviously include the Bitcoin Core daemon as well, but you do not
need to run it or sync a mainnet node yourself for this exercise.

## January 2024 cohort RPC server: `35.209.148.157`

Students will be emailed unique username / password pairs.

Usage example:

```sh
$ bitcoin-cli -rpcconnect=35.209.148.157 -rpcuser=a_plus_student -rpcpassword=hunter2 getblockcount
823280
```

or you can add these lines to your `bitcoin.conf` file:

```
rpcconnect=35.209.148.157
rpcuser=a_plus_student
rpcpassword=hunter2 getblockcount
```

...and then execute `bitcoin-cli getblockcount` without extra options.

*HINT*: Use `bitcoin-cli help` and `bitcoin-cli help <command name>` to learn
  what commands are available and what they do.


## Expected submissions

Every question must be answered by providing a bash script that executes `bitcoin-cli`
commands. No other commands should be necessary besides bash operators (for loops, if/else logic, etc)
and `jq`, which is a JSON parsing command you may need to manually install on your system.

Each student will get a private fork of this repository
when they join the GitHub Classroom assignment. You will commit and push your
submissions to GitHub which will evaluate the answers automatically. You can
commit and push as often as you like and GitHub will re-evaluate your code
every time.

There are empty template files for each script in the [submission](/submission)
directory in this repository. You MUST write your scripts into these files for
the autograder to work properly. Do NOT rename the script files!

Answer as many as you can. Some are easy, some are very hard!

## Scavenger hunt questions

### Solvable with a single `bitcoin-cli` commands

[001.sh](/submission/001.sh): What is the hash of block 654,321?

[002.sh](/submission/002.sh): (true / false) Verify the signature by this address over this message:

- address: `1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa`
- message: `1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa`
- signature: `HCsBcgB+Wcm8kOGMH8IpNeg0H4gjCrlqwDf/GlSXphZGBYxm0QkKEPhh9DTJRp2IDNUhVr0FhP9qCqo2W0recNM=`

### Requires one or more `bitcoin-cli` commands and `jq` to extract object properties

[003.sh](/submission/003.sh): How many new outputs were created by block 123,456?

[004.sh](/submission/004.sh): Using descriptors, compute the 100th taproot address derived from this extended public key:
  - `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`

[005.sh](/submission/005.sh): Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
  - `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`

### Requires multiple `bitcoin-cli` commands with `jq` and bash loops/conditionals

[006.sh](/submission/006.sh): Which tx in block 257,343 spends the coinbase output of block 256,128?

[007.sh](/submission/007.sh): Only one single output remains unspent from block 123,321. What address was it sent to?

[008.sh](/submission/008.sh): Which public key signed input 0 in this tx:
  - `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`



## Example:

*How many transactions are confirmed in block 666,666?*

Using local full node (or with proxy settings in `bitcoin.conf`):

```sh
hash=$(bitcoin-cli getblockhash 666666)
block=$(bitcoin-cli getblock $hash)
echo $block | jq .nTx
```

Answer: `2728`
