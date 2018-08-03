# blockchain_client_install
# linux ubunt 18.04 LTS

#########################################################
#######Bitcoin core source code & library download ######
#########################################################


mkdir src
cd src
sudo apt install git
git clone https://github.com/bitcoin/bitcoin.git
sudo apt-get update

##installing gcc


##installing openssl
sudo apt-get install libtool autotools-dev autoconf
sudo apt-get install openssl
sudo apt-get install libssl-dev

##installing boost
sudo apt-get install libboost-all-dev

##installing libdb4.8
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install libdb4.8-dev
sudo apt-get install libdb4.8++-dev

##installing related library
sudo apt-get install libminiupnpc-dev
sudo apt-get install libqrencode-dev

##instaaling gui library
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler

##building bitcoin core
cd bitcoin
./autogen.sh
./configure
make

##installing bitcoin core
sudo make install

##open local bitcoin server
#latest version
bitcoind -regtest -daemon 
#before version using accounts (accounts -> labels)
# bitcoind -regtest -deprecatedrpc=accounts -daemon 

##blockchain info
bitcoin-cli -regtest getblockchaininfo
bitcoin-cli -regtest -getinfo

##block generation
bitcoin-cli -regtest generate 101 ##101 mining (At least 100 blocks are required to operating bitcoin local server)

##count the number of blocks
bitcoin-cli -regtest getblockcount
bitcoin-cli -regtest getblockhash 100 
bitcoin-cii -regtest getblock "{block hash}"

##wallet creation
bitcoin-cli -regtest getnewaddress abcd 
bitcoin-cli -regtest getbalance "*"
bitcoin-cli -regtest getbalance abcd 0 ##not mining , deprecated version(v.0.18)

##transfer
bitcoin-cli -regtest sentoaddress $abcd 10 

##checking transactions
bitcoin-cli -regtest listunspent

##checking unconfrimed transactions
#confirm 0 txid list
bitcoin-cli -regtest listunspent 0 

##balance checking
bitcoin-cli -regtest getbalance "*"
bitcoin-cli -regtest getbalance abcd 0 ##not mining , deprecated version(v.0.18)

##checking transaction info
bitcoin-cli -regtest gettransaction "{txid / hash}"
bitcoin-cli -regtest getrawtransaction "{txid / hash}"
bitcoin-cli -regtest decoderawtransaction "hex"

##mining
bitcoin-cli -regtest generate 1
