tests - cards
testSpeedCardMakesThePlayerAdvance1MoreThanRolled

	| game |

	game := self gameWithBoardLength: 10 for: {bob}.
	game playCard: PermanentCard speed for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 3.	"1(current) + 1(roll) + 1(speed)"
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 5	"3(current) + 1(roll) + 1(speed)"