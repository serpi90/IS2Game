tests - cards
testOverloadCardAffectsOnlyAffectedPlayer

	| game |

	game := self
		gameWithBoardLength: 10
		for: (Array with: bob with: mary).
	game playCard: PermanentCard overload for: bob over: mary.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.	"1(current) + 1(roll)"
	game rollDiceFor: mary.
	self assert: (game positionOf: mary) tileNumber equals: 10.	"1(current) + 1(roll) - 2(overload) = -1 -> last of board of 10, so 10"
	self assert: (game positionOf: mary) lap equals: -1