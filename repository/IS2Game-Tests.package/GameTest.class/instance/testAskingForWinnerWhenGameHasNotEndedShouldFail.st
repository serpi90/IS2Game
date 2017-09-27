tests
testAskingForWinnerWhenGameHasNotEndedShouldFail

	| game |

	game := self gameWithBoardLength: 10 for: {bob}.
	self deny: game hasEnded.
	self should: [ game winner ] raise: AssertionFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Can not define a winner until game has ended' ]