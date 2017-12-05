tests - cards
testPlayersCanNotPlayOutOfTurn

	| game |

	game := self gameWithBoardLength: 10 for: (Array with: bob with: mary).
	self
		should: [ game playCard: PermanentCard speed for: mary over: bob ]
		raise: AssertionFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Mary can not play now, it''s Bob''s turn' ]