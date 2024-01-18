#!/bin/bash
cd /
git clone https://github.com/icon-project/xcall-multi
cd xcall-multi
cd contracts/evm
forge build
cp .env.example .env

# copy the required variables in const.sh to this .env file

cd -

