tests
testPlayersCanNotPlayOutOfTurn

	| game |

	game := self gameWithBoardLength: 10 for: (Array with: bob with: mary).

	game playTurnFor: bob.
	self should: [ game playTurnFor: bob ] raise: AssertionFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Bob can not play now, it''s Mary''s turn' ].
	game playTurnFor: mary.
	self should: [ game playTurnFor: mary ] raise: AssertionFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Mary can not play now, it''s Bob''s turn' ].
	game playTurnFor: bob.
	game playTurnFor: mary