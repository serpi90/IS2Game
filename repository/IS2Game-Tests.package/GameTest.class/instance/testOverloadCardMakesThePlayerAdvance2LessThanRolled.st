tests - cards
testOverloadCardMakesThePlayerAdvance2LessThanRolled

	| game |

	game := self
		gameWithTiles: (self emptyTiles: 10)
		rolling: #(4 2 1)
		for: {bob}.
	game playCard: PermanentCard overload for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 3.	"1(current) + 4(roll) - 2(overload)"
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 3.	"3(current) - 2(roll) - 2(overload)"
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2	"3(current) + 1(roll) - 2(overload)"