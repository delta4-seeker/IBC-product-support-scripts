repo:
	./const.sh
	./ready.sh 

deploy-centralized-evm:
	./evm.sh ${env} ${chain}

deploy-centralized-icon:
	./icon.sh ${jarFile} ${addrLoc}

centralized-fee:
	./evm.sh ${env} ${chain} ${network} ${fee}

