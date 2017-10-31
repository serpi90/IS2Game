tests - cards
testSpeedCardAffectsOnlyAffectedPlayer

	| game |

	game := self
		gameWithBoardLength: 10
		for: (Array with: bob with: mary).
	game playCard: PermanentCard speed for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 3.	"1(current) + 1(roll) + 1(speed)"
	game rollDiceFor: mary.
	self assert: (game positionOf: mary) tileNumber equals: 2	"1(current) + 1(roll)"