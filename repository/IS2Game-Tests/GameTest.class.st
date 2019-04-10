Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#instVars : [
		'bob',
		'mary'
	],
	#category : 'IS2Game-Tests'
}

{ #category : #accessing }
GameTest >> emptyTiles: aNumberOfTiles [

	^ (1 to: aNumberOfTiles) collect: [ :n | Tile withoutEffect ]
]

{ #category : #accessing }
GameTest >> gameWithBoardLength: aNumberOfTiles for: players [

	^ self gameWithTiles: (self emptyTiles: aNumberOfTiles) rolling: #(1) for: players
]

{ #category : #accessing }
GameTest >> gameWithTiles: tiles [

	^ self gameWithTiles: tiles rolling: #(1) for: {bob}
]

{ #category : #accessing }
GameTest >> gameWithTiles: tiles rolling: diceRolls for: players [

	^ IS2Game
		withBoard: (Board withTiles: tiles)
		laps: 3
		dice: (Dice withSides: 6 source: (SequentialGenerator generating: diceRolls))
		for: players
]

{ #category : #initialization }
GameTest >> setUp [

	bob := 'Bob'.
	mary := 'Mary'
]

{ #category : #tests }
GameTest >> testAskingForWinnerWhenGameHasNotEndedShouldFail [

	| game |

	game := self gameWithBoardLength: 10 for: {bob}.
	self deny: game hasEnded.
	self should: [ game winner ] raise: AssertionFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Can not define a winner until game has ended' ]
]

{ #category : #'tests - cards' }
GameTest >> testCushioningCardHalvesTileEffectsOfMoonwalk [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile withEffect: (Effect moonwalkGoingBack: 2)).

	game := self
		gameWithTiles: tiles
		rolling: #(1)
		for: (Array with: bob with: mary).
	game playCard: PermanentCard cushioning for: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.	"1(current) + 1(roll)"
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: mary) tileNumber equals: 10.	"1(current) - 2(moonwalk)/2(softening)"
	self assert: (game positionOf: mary) lap equals: -1
]

{ #category : #'tests - cards' }
GameTest >> testCushioningCardHalvesTileEffectsOfSpeedUp [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile withEffect: Effect speedUp).

	game := self gameWithTiles: tiles rolling: #(1) for: {bob}.
	game playCard: PermanentCard cushioning for: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 4	"1(current) + 1(roll) + 4(speedUp)/2(softening)"
]

{ #category : #'tests - cards' }
GameTest >> testCushioningCardHalvesTileEffectsOfWormhole [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile withEffect: Effect wormhole).

	game := self gameWithTiles: tiles rolling: #(1) for: {bob}.
	game playCard: PermanentCard cushioning for: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 10.	"1(current) + 1(roll) - 4(wormhole)/2(softening)"
	self assert: (game positionOf: bob) lap equals: -1
]

{ #category : #'tests - cards' }
GameTest >> testCushioningCardTwiceDividesBy4eEffectsOfWormhole [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile withEffect: Effect wormhole).

	game := self gameWithTiles: tiles rolling: #(1) for: {bob}.
	game playCard: PermanentCard cushioning for: bob.
	game playCard: PermanentCard cushioning for: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1.	"1(current) + 1(roll) - 4(wormhole)/2(softening)/2(softening)"
	self assert: (game positionOf: bob) lap equals: 0
]

{ #category : #tests }
GameTest >> testGameMustHaveAtLeastOneLap [

	self
		should: [ IS2Game
				withBoard: (Board withTiles: (self emptyTiles: 3))
				laps: 0
				dice: (Dice withSides: 6)
				for: {bob} ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'A game must at least have one lap' ]
]

{ #category : #tests }
GameTest >> testGameMustHaveAtLeastOnePlayer [

	self
		should: [ IS2Game
				withBoard: (Board withTiles: (self emptyTiles: 3))
				laps: 1
				dice: (Dice withSides: 6)
				for: #() ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'A game must at least have one player' ]
]

{ #category : #'tests - cards' }
GameTest >> testMultiplePermanentCards [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 6 put: (Tile withEffect: Effect speedUp).

	game := self gameWithTiles: tiles rolling: #(4) for: {bob}.
	game playCard: PermanentCard cushioning for: bob.
	game playCard: PermanentCard speed for: bob over: bob.
	game playCard: PermanentCard speed for: bob over: bob.
	game playCard: PermanentCard speed for: bob over: bob.
	game playCard: PermanentCard overload for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 8.	"1(current) + 4(roll) - 2(overload) + 3(speed) + 4(SpeedUp)/2(softening)"
	self assert: (game positionOf: bob) lap equals: 0
]

{ #category : #'tests - cards' }
GameTest >> testOverloadCardAffectsOnlyAffectedPlayer [

	| game |

	game := self
		gameWithBoardLength: 10
		for: (Array with: bob with: mary).
	game playCard: PermanentCard overload for: bob over: mary.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.	"1(current) + 1(roll)"
	game rollDiceFor: mary.
	self assert: (game positionOf: mary) tileNumber equals: 10.	"1(current) + 1(roll) - 2(overload) = -1 -> last of board of 10, so 10"
	self assert: (game positionOf: mary) lap equals: -1
]

{ #category : #'tests - cards' }
GameTest >> testOverloadCardCanBeUsedOnSelf [

	| game |

	game := self gameWithBoardLength: 10 for: (Array with: bob).
	game playCard: PermanentCard overload for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 10.	"1(current) + 1(roll) - 2(overload) = -1 -> last of board of 10, so 10"
	self assert: (game positionOf: bob) lap equals: -1
]

{ #category : #'tests - cards' }
GameTest >> testOverloadCardMakesThePlayerAdvance2LessThanRolled [

	| game |

	game := self
		gameWithTiles: (self emptyTiles: 10)
		rolling: #(4 2 1)
		for: {bob}.
	game playCard: PermanentCard overload for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 3.	"1(current) + 4(roll) - 2(overload)"
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 3.	"3(current) - 2(roll) - 2(overload)"
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2	"3(current) + 1(roll) - 2(overload)"
]

{ #category : #'tests - cards' }
GameTest >> testOverloadResetsLapIfGoingBackward [

	| game |

	game := self gameWithBoardLength: 10 for: (Array with: bob).
	game playCard: PermanentCard overload for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 10.	"1(current) + 1(roll) - 2(overload)"
	self assert: (game positionOf: bob) lap equals: -1
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnAtomicBombTileForcesAllPlayersToGoBackTotheBeginning [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 6 put: (Tile withEffect: Effect atomicBomb).
	game := self
		gameWithTiles: tiles
		rolling: #(4 4 1)
		for: (Array with: bob with: mary).
	game rollDiceFor: bob.
	game rollDiceFor: mary.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: mary) tileNumber equals: 5.
	self assert: (game positionOf: mary) lap equals: 0.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: mary) tileNumber equals: 1.
	self assert: (game positionOf: mary) lap equals: 0
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnEmptyTile [

	| game tiles |

	tiles := (1 to: 10) collect: [ :n | Tile withoutEffect ].
	game := self gameWithTiles: tiles.

	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.

	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	self assert: (game positionOf: bob) lap equals: 0
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnMoonwalkTileForcesAllOtherPlayersToGoBackANumberOfTiles [

	| game tiles positionForBob positionForMary |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile withEffect: (Effect moonwalkGoingBack: 2)).
	tiles at: 6 put: (Tile withEffect: (Effect moonwalkGoingBack: 3)).

	game := self
		gameWithTiles: tiles
		rolling: #(4 3 1 1)
		for: (Array with: bob with: mary).
	game rollDiceFor: bob.
	game rollDiceFor: mary.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	self assert: (game positionOf: mary) tileNumber equals: 4.
	positionForBob := game positionOf: bob.
	positionForMary := game positionOf: mary.
	game rollDiceFor: bob.
	self
		assert: (game positionOf: bob) tileNumber
		equals: positionForBob tileNumber + 1.
	self
		assert: (game positionOf: mary) tileNumber
		equals: positionForMary tileNumber - 3.
	positionForBob := game positionOf: bob.
	positionForMary := game positionOf: mary.
	game rollDiceFor: mary.
	self
		assert: (game positionOf: bob) tileNumber
		equals: positionForBob tileNumber - 2.
	self
		assert: (game positionOf: mary) tileNumber
		equals: positionForMary tileNumber + 1
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnSpeedUpTileAdvances4Positions [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile withEffect: Effect speedUp).

	game := self gameWithTiles: tiles.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 6.
	self assert: (game positionOf: bob) lap equals: 0.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 7.
	self assert: (game positionOf: bob) lap equals: 0
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnTimeMachineTileGoesBackToLastTurnPosition [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 4 put: (Tile withEffect: Effect timeMachine).

	game := self gameWithTiles: tiles rolling: #(1 2) for: {bob}.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnTimeMachineTileWithNotEnoughHistoryGoesBackToFirstTurnPosition [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile withEffect: Effect timeMachine).

	game := self gameWithTiles: tiles.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnWormholeTileGoesBack4Positions [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 6 put: (Tile withEffect: Effect wormhole).

	game := self gameWithTiles: tiles rolling: #(4 1) for: {bob}.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	self assert: (game positionOf: bob) lap equals: 0.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	self assert: (game positionOf: bob) lap equals: 0
]

{ #category : #'tests - positions' }
GameTest >> testPlayerStartsAtPositionAndLapZero [

	| game |

	game := self gameWithBoardLength: 10 for: (Array with: bob with: mary).
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: mary) lap equals: 0.
	self assert: (game positionOf: mary) tileNumber equals: 1
]

{ #category : #'tests - cards' }
GameTest >> testPlayersCanNotPlayOutOfTurn [

	| game |

	game := self gameWithBoardLength: 10 for: (Array with: bob with: mary).
	self
		should: [ game playCard: PermanentCard speed for: mary over: bob ]
		raise: AssertionFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Mary can not play now, it''s Bob''s turn' ]
]

{ #category : #tests }
GameTest >> testPlayingAfterWinningIsNotAllowed [

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
]

{ #category : #tests }
GameTest >> testPlayingUntilWinning [

	| game |

	game := IS2Game
		withBoard: (Board withTiles: (self emptyTiles: 5))
		laps: 3
		dice: (Dice withSides: 6 source: (SequentialGenerator generating: #(1 2 3 4)))
		for: (Array with: bob with: mary).
	self deny: game hasEnded.
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: mary) lap equals: 0.
	self assert: (game positionOf: mary) tileNumber equals: 1.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	game rollDiceFor: mary.
	self assert: (game positionOf: mary) tileNumber equals: 3.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	game rollDiceFor: mary.
	self assert: (game positionOf: mary) lap equals: 1.
	self assert: (game positionOf: mary) tileNumber equals: 2.
	game rollDiceFor: bob.
	game rollDiceFor: mary.
	game rollDiceFor: bob.
	game rollDiceFor: mary.
	game rollDiceFor: bob.
	game rollDiceFor: mary.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) lap equals: 2.
	self assert: (game positionOf: bob) tileNumber equals: 3.
	game rollDiceFor: mary.
	self assert: (game positionOf: mary) lap equals: 3.
	self assert: (game positionOf: mary) tileNumber equals: 4.
	self assert: game hasEnded.
	self assert: game winner equals: mary
]

{ #category : #'tests - positions' }
GameTest >> testPositionForBorderCaseWithBoardLengthedOne [

	| position game newPosition |

	game := IS2Game
		withBoard: (Board withTiles: {Tile withoutEffect})
		laps: 5
		dice: (Dice withSides: 6)
		for: {bob}.

	position := PlayerPosition startingOf: bob.
	newPosition := game positionFor: position whenMoving: 1.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 1.

	newPosition := game positionFor: position whenMoving: 2.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 2
]

{ #category : #'tests - positions' }
GameTest >> testPositionForWhenChangingLap [

	| position game newPosition |

	game := IS2Game
		withBoard: (Board withTiles: (self emptyTiles: 10))
		laps: 5
		dice: (Dice withSides: 6)
		for: {bob}.
	position := PlayerPosition of: bob onLap: 0 tileNumber: 10.
	newPosition := game positionFor: position whenMoving: 1.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 1.

	position := PlayerPosition of: bob onLap: 0 tileNumber: 5.
	newPosition := game positionFor: position whenMoving: 21.
	self assert: newPosition tileNumber equals: 6.
	self assert: newPosition lap equals: 2.

	position := PlayerPosition of: bob onLap: 2 tileNumber: 6.
	newPosition := game positionFor: position whenMoving: 5.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 3
]

{ #category : #'tests - positions' }
GameTest >> testPositionForWhenChangingLapBackwards [

	| position game newPosition |

	game := self gameWithBoardLength: 10 for: {bob}.
	position := PlayerPosition of: bob onLap: 0 tileNumber: 1.
	newPosition := game positionFor: position whenMoving: -1.
	self assert: newPosition tileNumber equals: 10.
	self assert: newPosition lap equals: -1
]

{ #category : #'tests - positions' }
GameTest >> testPositionForWhenMoving [

	| game position newPosition |

	game := IS2Game
		withBoard: (Board withTiles: (self emptyTiles: 5))
		laps: 3
		dice: (Dice withSides: 6)
		for: {bob}.
	position := PlayerPosition startingOf: bob.
	newPosition := game positionFor: position whenMoving: 2.
	self assert: newPosition tileNumber equals: 3.
	self assert: newPosition lap equals: 0.
	newPosition := game positionFor: position whenMoving: 6.
	self assert: newPosition tileNumber equals: 2.
	self assert: newPosition lap equals: 1.

	position := PlayerPosition of: bob onLap: 3 tileNumber: 4.
	newPosition := game positionFor: position whenMoving: 1.
	self assert: newPosition tileNumber equals: 5.
	self assert: newPosition lap equals: 3.
	newPosition := game positionFor: position whenMoving: 2.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 4
]

{ #category : #'tests - positions' }
GameTest >> testPositionForWhenNotChangingLap [

	| position game player newPosition |

	player := 'bob'.
	game := IS2Game
		withBoard: (Board withTiles: (self emptyTiles: 10))
		laps: 5
		dice: (Dice withSides: 6)
		for: {player}.
	position := PlayerPosition startingOf: player.
	newPosition := game positionFor: position whenMoving: 1.
	self assert: newPosition tileNumber equals: 2.
	self assert: newPosition lap equals: 0.

	position := PlayerPosition of: player onLap: 2 tileNumber: 5.
	newPosition := game positionFor: position whenMoving: 3.
	self assert: newPosition tileNumber equals: 8.
	self assert: newPosition lap equals: 2.

	position := PlayerPosition of: player onLap: 2 tileNumber: 3.
	newPosition := game positionFor: position whenMoving: 5.
	self assert: newPosition tileNumber equals: 8.
	self assert: newPosition lap equals: 2
]

{ #category : #'tests - cards' }
GameTest >> testSpeedCardAffectsOnlyAffectedPlayer [

	| game |

	game := self
		gameWithBoardLength: 10
		for: (Array with: bob with: mary).
	game playCard: PermanentCard speed for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 3.	"1(current) + 1(roll) + 1(speed)"
	game rollDiceFor: mary.
	self assert: (game positionOf: mary) tileNumber equals: 2	"1(current) + 1(roll)"
]

{ #category : #'tests - cards' }
GameTest >> testSpeedCardAffectsTheThrowBeforeApplyingTileEffect [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 3 put: (Tile withEffect: Effect speedUp).
	game := self gameWithTiles: tiles rolling: #(1) for: {bob}.
	game playCard: PermanentCard speed for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 7.	"1(current) + 1(roll) + 1(speed) + 4(SpeedUp)"
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 9	"5(current) + 1(roll) + 1(speed)"
]

{ #category : #'tests - cards' }
GameTest >> testSpeedCardCanBeUsedOnAnotherPlayer [

	| game |

	game := self
		gameWithBoardLength: 10
		for: (Array with: bob with: mary).
	game playCard: PermanentCard speed for: bob over: mary.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.	"1(current) + 1(roll)"
	game rollDiceFor: mary.
	self assert: (game positionOf: mary) tileNumber equals: 3.	"1(current) + 1(roll) + 1(speed)"
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 3.	"2(current) + 1(roll)"
	game rollDiceFor: mary.
	self assert: (game positionOf: mary) tileNumber equals: 5	"3(current) + 1(roll) + 1(speed)"
]

{ #category : #'tests - cards' }
GameTest >> testSpeedCardMakesThePlayerAdvance1MoreThanRolled [

	| game |

	game := self gameWithBoardLength: 10 for: {bob}.
	game playCard: PermanentCard speed for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 3.	"1(current) + 1(roll) + 1(speed)"
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 5	"3(current) + 1(roll) + 1(speed)"
]

{ #category : #'tests - cards' }
GameTest >> testSpeedCardTiwceMakesThePlayerAdvance2MoreThanRolled [

	| game |

	game := self gameWithBoardLength: 10 for: {bob}.
	game playCard: PermanentCard speed for: bob over: bob.
	game playCard: PermanentCard speed for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 4.	"1(current) + 1(roll) + 1(speed) + 1(speed)"
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 7	"4(current) + 1(roll) + 1(speed) + 1(speed)"
]
