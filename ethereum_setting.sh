##install ethereum

sudo apt-get install -y build-essential libgmp3-dev golang git tree

sudo apt-get update

sudo apt-get install golang-go

sudo git clone https://github.com/ethereum/go-ethereum

cd go-ethereum


#version checkout
sudo git checkout refs/tags/v1.8.13
sudo make geth

sudo cp build/bin/geth /usr/local/bin

#genesis block settup
sudo cp genesis.json ${home}/go-ethereum/build/bin

#create node
sudo mkdir ${home}/go-ethereum/build/bin/node

#initialize geth(go ether)
sudo ./geth --datadir ./node init genesis.json

#start geth
sudo ./geth --networkid 4649 --nodiscover --maxpreers 0 --datadir ./node console


#create account
personal.newAccount("password1")
personal.newAccount("passwrod2")

#view accounts
eth.accounts

eth.getBalance(eth.accounts[0])
eth.getBalance(eth.accounts[1])

#view blocks
eth.blockNumber

#set mining coin account
eth.coinbase
miner.setEtherbase(eth.accounts[1])

#mining
miner.start()

mining.stop()