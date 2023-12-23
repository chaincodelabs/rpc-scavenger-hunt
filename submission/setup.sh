wget https://bitcoincore.org/bin/bitcoin-core-26.0/bitcoin-26.0-x86_64-linux-gnu.tar.gz
tar -xzvf bitcoin-26.0-x86_64-linux-gnu.tar.gz
ln -s $PWD/bitcoin-26.0/bin/* /usr/local/bin/
mkdir -p ~/.bitcoin
echo "rpcconnect=35.209.148.157" >> ~/.bitcoin/bitcoin.conf
echo "rpcuser=classroom" >> ~/.bitcoin/bitcoin.conf
echo "rpcpassword=sNCAmDkQgHtk" >> ~/.bitcoin/bitcoin.conf