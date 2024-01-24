# Prerequisities

git
foundry
goloop


# To pull the xcall-multi repo

```shell
$ make repo
```

# To pull the xcall jar file for icon

```shell
$ make pull-xcall-jar
```

# To pull the centralized connection jar file for icon

```shell
$ make pull-centralized-connection-jar
```

# To deploy contract on icon

```shell
$ make deploy-icon contract=<contract_name> param=<constructor parameters>
  
```

For example : 

Deploying xcall on icon
```shell
$ make deploy-icon contract=xcall param=helloNetwork   
```

Deploying centralized-connection on icon
```shell
$ make deploy-icon contract=centralized-connection param=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a   
```

# To deploy contract on evm

```shell
$ make deploy-evm contract=<valid_contracts> chain=<valid_chains> env=<valid_environments>    
```

valid_environments
    -mainnet
    -testnet

valid_contracts
    -xcall
    -centralized-connection

valid_chains
    -mainnet
        -ethereum
        -binance
        -avalanche
        -arbitrum
        -optimism
        -base
        -all
    -testnet
        -sepolia
        -bsc_testnet or binance
        -fuji or avalanche
        -arbitrum_goerli or arbitrum
        -optimism_goerli or optimism
        -base_goerli or base
        -all

For example : 

**On testnet**
```shell
$ make deploy-evm contract=xcall chain=avalanche env=testnet    
```

**On mainnet**
```shell
$ make deploy-evm contract=centralized-connection chain=avalanche env=mainnet    
```

# To call function on icon

```shell
$ make icon-call-function contract=<contract_name> to_set=<variable_name> arg=<value_to_set>
```

valid_contracts
    -xcall
    -centralized-connection

valid_variable_name
    -admin
    -protocol-fee-handler
    -protocol-fee

value_to_set
    -for admin
        - example: hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
    -for protocol-fee-handler
        - example: hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
    -for protocol-fee
        - example: 1

For example:

```shell
$ make icon-call-function contract=xcall to_set=protocol-fee arg=1 
```

```shell
$ make icon-call-function contract=xcall to_set=protocol-fee-handler arg=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
```

```shell
$ make icon-call-function contract=xcall to_set=admin arg=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
```

```shell
$ make icon-call-function contract=centralized-connection to_set=admin arg=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
```


# To call function on evm

```shell
$ make evm-call-function contract=<contract_name> to_set=<variable_name> arg=<value_to_set> rpc-url=<rpc url of contract deployed chain>
```

valid_contracts
    -xcall
    -centralized-connection

valid_variable_name
    -admin
    -protocol-fee-handler
    -protocol-fee

value_to_set
    -for admin
        - example: 0xb794f5ea0ba39494ce839613fffba74279579268
    -for protocol-fee-handler
        - example: 0xb794f5ea0ba39494ce839613fffba74279579268
    -for protocol-fee
        - example: 1

For example:

```shell
$ make evm-call-function contract=xcall to_set=protocol-fee arg=1 rpc-url=https://bsc-testnet.drpc.org
```

```shell
$ make evm-call-function contract=xcall to_set=protocol-fee-handler arg=0xb794f5ea0ba39494ce839613fffba74279579268 rpc-url=https://bsc-testnet.drpc.org
```

```shell
$ make evm-call-function contract=xcall to_set=admin arg=0xb794f5ea0ba39494ce839613fffba74279579268 rpc-url=https://bsc-testnet.drpc.org
```

```shell
$ make evm-call-function contract=centralized-connection to_set=admin arg=0xb794f5ea0ba39494ce839613fffba74279579268 rpc-url=https://bsc-testnet.drpc.org
```



