tests - cards
testOverloadCardCanBeUsedOnSelf

	| game |

	game := self gameWithBoardLength: 10 for: (Array with: bob).
	game playCard: PermanentCard overload for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 10.	"1(current) + 1(roll) - 2(overload) = -1 -> last of board of 10, so 10"
	self assert: (game positionOf: bob) lap equals: -1