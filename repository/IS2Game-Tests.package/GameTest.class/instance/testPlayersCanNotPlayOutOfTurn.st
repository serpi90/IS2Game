tests
testPlayersCanNotPlayOutOfTurn

	| game |

	game := self gameWithBoardLength: 10 for: (Array with: bob with: mary).

	game rollDiceFor: bob.
	self should: [ game rollDiceFor: bob ] raise: AssertionFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Bob can not play now, it''s Mary''s turn' ].
	game rollDiceFor: mary.
	self should: [ game rollDiceFor: mary ] raise: AssertionFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Mary can not play now, it''s Bob''s turn' ].
	game rollDiceFor: bob.
	game rollDiceFor: mary