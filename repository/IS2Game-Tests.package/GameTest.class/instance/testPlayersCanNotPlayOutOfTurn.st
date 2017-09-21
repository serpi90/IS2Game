tests
testPlayersCanNotPlayOutOfTurn

	| game bob mary |

	bob := 'Bob'.
	mary := 'Mary'.
	game := IS2Game
		withBoardOfLength: 5
		laps: 3
		dices: (Dice withSides: 6 source: (SequentialGenerator generating: #(1)))
		for: (Array with: bob with: mary).

	game throwDiceFor: bob.
	self should: [ game throwDiceFor: bob ] raise: AssertionFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Bob can not play now, it''s Mary''s turn' ].
	game throwDiceFor: mary.
	self should: [ game throwDiceFor: mary ] raise: AssertionFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Mary can not play now, it''s Bob''s turn' ].
	game throwDiceFor: bob.
	game throwDiceFor: mary