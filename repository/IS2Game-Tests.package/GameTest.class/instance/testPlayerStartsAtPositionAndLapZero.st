tests
testPlayerStartsAtPositionAndLapZero

	| game bob mary |
	bob := 'Bob'.
	mary := 'Mary'.
	game := IS2Game
		withBoardLength: 5
		laps: 3
		dices: (Dice sides: 6 source: (SequentialGenerator generating: #(1)))
		for: (Array with: bob with: mary).
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: bob) tile equals: 0.
	self assert: (game positionOf: mary) lap equals: 0.
	self assert: (game positionOf: mary) tile equals: 0