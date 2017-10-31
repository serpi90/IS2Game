tests - cards
testOverloadResetsLapIfGoingBackward

	| game |

	game := self gameWithBoardLength: 10 for: (Array with: bob).
	game playCard: PermanentCard overload for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 10.	"1(current) + 1(roll) - 2(overload)"
	self assert: (game positionOf: bob) lap equals: -1