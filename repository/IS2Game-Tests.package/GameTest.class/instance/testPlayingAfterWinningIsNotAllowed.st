tests
testPlayingAfterWinningIsNotAllowed

	| game players |

	players := Array with: bob with: mary.

	game := IS2Game
		withBoard: (Board withTiles: (self emptyTiles: 3))
		laps: 1
		dice: (Dice withSides: 6 source: (SequentialGenerator generating: #(4)))
		for: players.
	self deny: game hasEnded.
	game rollDiceFor: bob.
	self assert: game hasEnded.
	players
		do: [ :player | 
			self
				should: [ game rollDiceFor: player ]
				raise: AssertionFailed
				withExceptionDo: [ :signal | self assert: signal messageText equals: ('<1s> can not play now, the game has ended' expandMacrosWith: player) ].
			self
				should: [ game playCard: PermanentCard cushioning for: player ]
				raise: AssertionFailed
				withExceptionDo: [ :signal | self assert: signal messageText equals: ('<1s> can not play now, the game has ended' expandMacrosWith: player) ] ]