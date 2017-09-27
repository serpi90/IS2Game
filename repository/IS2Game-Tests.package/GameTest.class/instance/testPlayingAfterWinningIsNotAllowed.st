tests
testPlayingAfterWinningIsNotAllowed

	| game |

	game := IS2Game
		withBoard: (Board withTiles: (self emptyTiles: 3))
		laps: 1
		dice: (Dice withSides: 6 source: (SequentialGenerator generating: #(4)))
		for: (Array with: bob with: mary).
	self deny: game hasEnded.
	game playTurnFor: bob.
	self assert: game hasEnded.
	self should: [ game playTurnFor: mary ] raise: AssertionFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Mary can not play now, the game has ended' ]