"
An EffectTest is a test class for testing the behavior of Effect
"
Class {
	#name : #EffectActionTest,
	#superclass : #TestCase,
	#instVars : [
		'playerHistory',
		'player'
	],
	#category : 'IS2Game-Tests'
}

{ #category : #mocking }
EffectActionTest >> addPosition: aPlayerPosition [

	playerHistory add: aPlayerPosition
]

{ #category : #assertions }
EffectActionTest >> assert: aPlayer isOnLap: aLap tileNumber: aTileNumber [

	| position |

	position := self positionOf: aPlayer.
	self assert: position player equals: aPlayer.
	self assert: position tileNumber equals: aTileNumber.
	self assert: position lap equals: aLap
]

{ #category : #mocking }
EffectActionTest >> historyFor: aPlayer [

	^ playerHistory
]

{ #category : #mocking }
EffectActionTest >> move: aPlayer tiles: aNumberOfTiles [

	| position |

	position := self positionOf: aPlayer.
	self
		addPosition:
			( PlayerPosition of: aPlayer onLap: position lap tileNumber: position tileNumber + aNumberOfTiles )
]

{ #category : #mocking }
EffectActionTest >> positionOf: aPlayer [

	^ playerHistory last
]

{ #category : #initialization }
EffectActionTest >> setUp [

	player := 'A Player'.
	playerHistory := OrderedCollection with: ( PlayerPosition startingOf: player )
]

{ #category : #tests }
EffectActionTest >> testCanNotMoveForwardOrBackwardZeroTiles [

	self
		should: [ MovePlayer movingForward: 0 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Move effect can not be 0' ].
	self
		should: [ MovePlayer goingBack: 0 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Move effect can not be 0' ]
]

{ #category : #tests }
EffectActionTest >> testCanNotUndoANegativeNumberOfTurns [

	self
		should: [ UndoTurn goingBack: -3 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Can not undo a negative player of turns' ]
]

{ #category : #tests }
EffectActionTest >> testMovePlayer [

	self assert: player isOnLap: 0 tileNumber: 1.
	( MovePlayer movingForward: 3 ) affect: player on: self.
	self assert: player isOnLap: 0 tileNumber: 4
]

{ #category : #tests }
EffectActionTest >> testNoEffect [

	self assert: player isOnLap: 0 tileNumber: 1.
	NoEffect new affect: player on: self.
	self assert: player isOnLap: 0 tileNumber: 1
]

{ #category : #tests }
EffectActionTest >> testPrintOn [

	self assert: NoEffect new printString equals: 'No effect'.
	self assert: ( MovePlayer movingForward: 3 ) printString equals: 'Move forward 3 tiles'.
	self assert: ( MovePlayer goingBack: 4 ) printString equals: 'Go back 4 tiles'.
	self assert: ( MovePlayer goingBack: 1 ) printString equals: 'Go back 1 tile'.
	self assert: ( UndoTurn goingBack: 1 ) printString equals: 'Go back 1 turn'.
	self assert: ( UndoTurn goingBack: 5 ) printString equals: 'Go back 5 turns'.
	self assert: ( RepositionPlayer toLap: 1 tileNumber: 2 ) printString equals: 'Go to lap 1 tile 2'
]

{ #category : #tests }
EffectActionTest >> testRepositionPlayer [

	self assert: player isOnLap: 0 tileNumber: 1.
	( RepositionPlayer toLap: 3 tileNumber: 5 ) affect: player on: self.
	self assert: player isOnLap: 3 tileNumber: 5
]

{ #category : #tests }
EffectActionTest >> testResetTurn [

	" The resulting tile is substracted 2 because:
	- 1 for the position at the beginning of this turn (before throwing the dice, the player was at 9th tile)
	- 1 tile for the move made in this turn (after throwing the dice the player moved to the 10th tile, the one with the undo effect
	So, the 8th tile is the position at the start of the previous turn.
	* Undoing 0 turns would leave the player where it was before throwing the dice."

	playerHistory := ( ( 1 to: 10 ) collect: [ :n | PlayerPosition of: player onLap: 0 tileNumber: n ] )
		asOrderedCollection.
	self assert: ( self positionOf: player ) equals: playerHistory last.
	UndoTurn resetTurn affect: player on: self.
	self assert: player isOnLap: 0 tileNumber: 10 - 2
]

{ #category : #tests }
EffectActionTest >> testUndoTurn [

	" The resulting tile is substracted 2 because:
	- 1 for the position at the beginning of this turn (before throwing the dice, the player was at 9th tile)
	- 1 tile for the move made in this turn (after throwing the dice the player moved to the 10th tile, the one with the undo effect
	So, the 8th tile is the position at the start of the previous turn.
	* Undoing 0 turns would leave the player where it was before throwing the dice.
	* Undoing 1 turn would leave the player at the 8th tile (where it was on the previous turn).
	* Undoing 2 turn would leave the player at the 7th tile (where it was 2 turns ago).	"

	| turnsToGoBack |

	turnsToGoBack := 5.
	playerHistory := ( ( 1 to: 10 ) collect: [ :n | PlayerPosition of: player onLap: 0 tileNumber: n ] )
		asOrderedCollection.
	self assert: ( self positionOf: player ) equals: playerHistory last.
	( UndoTurn goingBack: turnsToGoBack ) affect: player on: self.
	self assert: player isOnLap: 0 tileNumber: 10 - turnsToGoBack - 2
]

{ #category : #tests }
EffectActionTest >> testUndoTurnWithFewerHistoryThanNeded [

	"History should always have at least 2 elements when the effect is applied (See testUndoTurn comment)"

	2 to: 4 do: [ :historySize | 
		playerHistory := ( ( 1 to: historySize )
			collect: [ :n | PlayerPosition of: player onLap: 0 tileNumber: n ] ) asOrderedCollection.
		self assert: ( self positionOf: player ) equals: playerHistory last.
		( UndoTurn goingBack: 2 ) affect: player on: self.
		self assert: player isOnLap: 0 tileNumber: 1
		]
]
