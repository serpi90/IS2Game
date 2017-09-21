tests
testAskingForWinnerWhenGameHasNotEndedShouldFail

	| game bob mary |

	bob := 'Bob'.
	mary := 'Mary'.
	game := IS2Game
		withBoardLength: 5
		laps: 3
		dices: (Dice sides: 6 source: (SequentialGenerator generating: #(1 2 3 4)))
		for: (Array with: bob with: mary).
	self deny: game hasEnded.
	self should: [ game winner ] raise: AssertionFailed