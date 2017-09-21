tests
testPlayingAfterWinningIsNotAllowed

	| game bob mary |

	bob := 'Bob'.
	mary := 'Mary'.
	game := IS2Game
		withBoardOfLength: 3
		laps: 1
		dices: (Dice withSides: 6 source: (SequentialGenerator generating: #(4)))
		for: (Array with: bob with: mary).
	self deny: game hasEnded.
	game throwDiceFor: bob.
	self assert: game hasEnded.
	self should: [ game throwDiceFor: mary ] raise: AssertionFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Mary can not play now, the game has ended' ]