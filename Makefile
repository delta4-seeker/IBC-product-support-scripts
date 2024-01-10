repo:
	./const.sh
	./ready.sh 

deploy-centralized:
	./evm.sh ${env} ${chain}

centralized-fee:
	./evm.sh ${env} ${chain} ${network} ${fee}

