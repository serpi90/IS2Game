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

	^ (1 to: aNumberOfTiles) collect: [ :n | Tile numbered: n ]
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

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnAtomicBombTileForcesAllPlayersToGoBackTotheBeginning [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 6 put: (Tile numbered: 6 withEffect: Effect atomicBomb).
	game := self gameWithTiles: tiles rolling: #(4 4 1) for: (Array with: bob with: mary).
	game playTurnFor: bob.
	game playTurnFor: mary.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: mary) tileNumber equals: 5.
	self assert: (game positionOf: mary) lap equals: 0.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: mary) tileNumber equals: 1.
	self assert: (game positionOf: mary) lap equals: 0
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnEmptyTile [

	| game tiles |

	tiles := (1 to: 10) collect: [ :n | Tile numbered: n ].
	game := self gameWithTiles: tiles.

	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.

	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	self assert: (game positionOf: bob) lap equals: 0
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnMoonwalkTileForcesAllOtherPlayersToGoBackANumberOfTiles [

	| game tiles positionForBob positionForMary |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile numbered: 2 withEffect: (Effect moonwalkGoingBack: 2)).
	tiles at: 6 put: (Tile numbered: 6 withEffect: (Effect moonwalkGoingBack: 3)).

	game := self gameWithTiles: tiles rolling: #(4 3 1 1) for: (Array with: bob with: mary).
	game playTurnFor: bob.
	game playTurnFor: mary.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	self assert: (game positionOf: mary) tileNumber equals: 4.
	positionForBob := game positionOf: bob.
	positionForMary := game positionOf: mary.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: positionForBob tileNumber + 1.
	self assert: (game positionOf: mary) tileNumber equals: positionForMary tileNumber - 3.
	positionForBob := game positionOf: bob.
	positionForMary := game positionOf: mary.
	game playTurnFor: mary.
	self assert: (game positionOf: bob) tileNumber equals: positionForBob tileNumber - 2.
	self assert: (game positionOf: mary) tileNumber equals: positionForMary tileNumber + 1
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnSpeedUpTileAdvances4Positions [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile numbered: 2 withEffect: Effect speedUp).

	game := self gameWithTiles: tiles.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 6.
	self assert: (game positionOf: bob) lap equals: 0.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 7.
	self assert: (game positionOf: bob) lap equals: 0
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnTimeMachineTileGoesBackToLastTurnPosition [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 4 put: (Tile numbered: 4 withEffect: Effect timeMachine).

	game := self gameWithTiles: tiles rolling: #(1 2) for: {bob}.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnTimeMachineTileWithNotEnoughHistoryGoesBackToFirstTurnPosition [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile numbered: 2 withEffect: Effect timeMachine).

	game := self gameWithTiles: tiles.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1
]

{ #category : #'tests - tiles' }
GameTest >> testPlayerLandingOnWormholeTileGoesBack4Positions [

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 6 put: (Tile numbered: 6 withEffect: Effect wormhole).

	game := self gameWithTiles: tiles rolling: #(4 1) for: {bob}.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	self assert: (game positionOf: bob) lap equals: 0.
	game playTurnFor: bob.
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

{ #category : #tests }
GameTest >> testPlayersCanNotPlayOutOfTurn [

	| game |

	game := self gameWithBoardLength: 10 for: (Array with: bob with: mary).

	game playTurnFor: bob.
	self should: [ game playTurnFor: bob ] raise: AssertionFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Bob can not play now, it''s Mary''s turn' ].
	game playTurnFor: mary.
	self should: [ game playTurnFor: mary ] raise: AssertionFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Mary can not play now, it''s Bob''s turn' ].
	game playTurnFor: bob.
	game playTurnFor: mary
]

{ #category : #tests }
GameTest >> testPlayingAfterWinningIsNotAllowed [

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
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	game playTurnFor: mary.
	self assert: (game positionOf: mary) tileNumber equals: 3.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	game playTurnFor: mary.
	self assert: (game positionOf: mary) lap equals: 1.
	self assert: (game positionOf: mary) tileNumber equals: 2.
	game playTurnFor: bob.
	game playTurnFor: mary.
	game playTurnFor: bob.
	game playTurnFor: mary.
	game playTurnFor: bob.
	game playTurnFor: mary.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) lap equals: 2.
	self assert: (game positionOf: bob) tileNumber equals: 3.
	game playTurnFor: mary.
	self assert: (game positionOf: mary) lap equals: 3.
	self assert: (game positionOf: mary) tileNumber equals: 4.
	self assert: game hasEnded
]

{ #category : #'tests - positions' }
GameTest >> testPositionForBorderCaseWithBoardLengthedOne [

	| position game newPosition |

	game := IS2Game
		withBoard: (Board withTiles: {(Tile numbered: 1)})
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
