tests
testPlayingUntilWinning

	| game bob mary |

	bob := 'Bob'.
	mary := 'Mary'.
	game := IS2Game
		withBoardLength: 5
		laps: 3
		dices: (Dice sides: 6 source: (SequentialGenerator generating: #(1 2 3 4)))
		for: (Array with: bob with: mary).
	self deny: game hasEnded.
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: bob) tile equals: 0.
	self assert: (game positionOf: mary) lap equals: 0.
	self assert: (game positionOf: mary) tile equals: 0.
	game throwDiceFor: bob.
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: bob) tile equals: 1.
	self assert: (game positionOf: mary) lap equals: 0.
	self assert: (game positionOf: mary) tile equals: 0.
	game throwDiceFor: mary.
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: bob) tile equals: 1.
	self assert: (game positionOf: mary) lap equals: 0.
	self assert: (game positionOf: mary) tile equals: 2.
	game throwDiceFor: bob.
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: bob) tile equals: 4.
	game throwDiceFor: mary.
	self assert: (game positionOf: mary) lap equals: 1.
	self assert: (game positionOf: mary) tile equals: 1.
	game throwDiceFor: bob.
	game throwDiceFor: mary.
	game throwDiceFor: bob.
	game throwDiceFor: mary.
	game throwDiceFor: bob.
	game throwDiceFor: mary.
	game throwDiceFor: bob.
	self assert: (game positionOf: bob) lap equals: 2.
	self assert: (game positionOf: bob) tile equals: 2.
	game throwDiceFor: mary.
	self assert: (game positionOf: mary) lap equals: 3.
	self assert: (game positionOf: mary) tile equals: 3.
	self assert: game hasEnded.
	self assert: game winner equals: mary