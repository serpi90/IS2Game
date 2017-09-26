tests
testAskingForWinnerWhenGameHasNotEndedShouldFail

	| game |

	game := IS2Game
		withBoardOfLength: 5
		laps: 3
		dices:
			(Dice
				withSides: 6
				source: (SequentialGenerator generating: #(1 2 3 4)))
		for: (Array with: bob with: mary).
	self deny: game hasEnded.
	self
		should: [ game winner ]
		raise: AssertionFailed
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'Can not define a winner until game has ended' ]