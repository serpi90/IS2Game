tests
testPlayersCanNotPlayOutOfTurn

	| game bob mary |

	bob := 'Bob'.
	mary := 'Mary'.
	game := IS2Game
		withBoardLength: 5
		laps: 3
		dices: (Dice sides: 6 source: (SequentialGenerator generating: #(1)))
		for: (Array with: bob with: mary).

	game throwDiceFor: bob.
	self should: [ game throwDiceFor: bob ] raise: Error.
	game throwDiceFor: mary.
	self should: [ game throwDiceFor: mary ] raise: Error.
	game throwDiceFor: bob.
	game throwDiceFor: mary