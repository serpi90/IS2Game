tests - cards
testSpeedCardTiwceMakesThePlayerAdvance2MoreThanRolled

	| game |

	game := self gameWithBoardLength: 10 for: {bob}.
	game playCard: PermanentCard speed for: bob over: bob.
	game playCard: PermanentCard speed for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 4.	"1(current) + 1(roll) + 1(speed) + 1(speed)"
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 7	"4(current) + 1(roll) + 1(speed) + 1(speed)"