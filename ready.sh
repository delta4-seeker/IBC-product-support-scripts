#!/bin/bash
source const.sh

mkdir -p $CONTRACT_ENV
cd env
mkdir -p icon
mkdir -p evm

cd icon
touch icon_centralized_connection.txt
touch icon_xcall.txt
cd ..


cd evm
touch evm_centralized_connection.txt
touch evm_xcall.txt
cd ..


cd $ROOT_DIR
git clone https://github.com/icon-project/xcall-multi
cd xcall-multi
cd contracts/evm
forge build
cp .env.example .env

# copy the required variables in const.sh to this .env file

cd -

