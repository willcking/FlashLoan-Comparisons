# Brief
Compare the common FlashLoan protocols, horizontally compare their differences, and make a demo of their usage by Foundry.

# Comparisons
|| Chain | Name | Callback Name | Asset kinds per FlashLoan | Pay back |Repayment indicators|Pay back obj| Pay back type |
|--------------|-------|-----|----------------|---------------------------|----------|--------------------|----|----|
| uniswapV2 | ETH | swap() | uniswapV2Call() | 1/2 | 1/2 . transfer token | Value(K) | Interact with pool | ERC20 |
| uniswapV3 | ETH | flash() | uniswapV3FlashCallback() |1/2 |	Pay back what you flashloan. transfer token	|Amount	| Interact with pool | ERC20 |
| AAVEV1 | ETH | flashLoan() | executeOperation() | 1 |	Pay back what you flashloan. transfer token	Amount |	Interact with pool, but borrow from core contract |	ERC20/ETH |
|AAVEV2 | ETH,AVAX,Polygon | flashLoan() | executeOperation() | 1/n | Pay back what you flashloan. approve token/Create a new debt positions | Amount | Interact with pool, but borrow from aToken contract | ERC20 |
|AAVEV3 | ETH,AVAX,Base,Arb,Fant,Op... | flashLoan()/flashLoanSimple() | two kinds of executeOperation() | 1/n |Pay back what you flashloan. approve token/Create a new debt positions | Amount | Interact with pool, but borrow from aEthToken contract | ERC20 |
|SushiSwapV2| ETH, BSC, Base, Arb, OP, Poly... | swap() | uniswapV2Call() |	1/2 | 1/2. transfer token |	Value(K) | Interact with pool |	ERC20 |
|SushiSwapV3 | ETH, BSC, Base, Arb, OP, Poly...| flash() | uniswapV3FlashCallback() | 1/2 | Pay back what you flashloan. transfer token | Amount | Interact with pool |	ERC20 |
|PancakeSwapV2 |BSC|swap()|	pancakeCall()|1/2|	1/2. transfer token|Value(K)|Interact with pool|ERC20|
|PancakeSwapV3	|BSC|flash()|	pancakeV3FlashCallback()|1/2|	Pay back what you flashloan. transfer token	|Amount|	Interact with pool|	ERC20|
|Euler|ETH|	flashLoan()|onFlashLoan()|1|Pay back what you flashloan. approve token|	Amount|	The contract itself	|ERC20|
|MakerDAO|ETH|flashLoan()|onFlashLoan()|DAI	|Only DAI。approve DAI|	Amount	|The contract itself|DAI|
|Balancer | ETH, polygon, Base, OP... | flashLoan() |	receiveFlashLoan()|	n | Pay back what you flashloan. transfer token	| Amount |The contract itself	|ERC20|