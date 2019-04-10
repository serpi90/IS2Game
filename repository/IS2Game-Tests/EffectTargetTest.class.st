"
An EffectTargetTest is a test class for testing the behavior of EffectTarget
"
Class {
	#name : #EffectTargetTest,
	#superclass : #TestCase,
	#instVars : [
		'moveOneTile',
		'playerPositions',
		'player1',
		'player2',
		'player3'
	],
	#category : 'IS2Game-Tests'
}

{ #category : #asserting }
EffectTargetTest >> assert: aPlayer isOnLap: aLap tileNumber: aTileNumber [

	| position |

	position := self positionOf: aPlayer.
	self assert: position player equals: aPlayer.
	self assert: position tileNumber equals: aTileNumber.
	self assert: position lap equals: aLap
]

{ #category : #asserting }
EffectTargetTest >> move: aPlayer tiles: aNumberOfTiles [

	| position |

	position := playerPositions at: aPlayer.
	playerPositions at: aPlayer put: (PlayerPosition of: position player onLap: position lap tileNumber: position tileNumber + aNumberOfTiles)
]

{ #category : #mocking }
EffectTargetTest >> players [

	^ playerPositions keys
]

{ #category : #mocking }
EffectTargetTest >> positionOf: aPlayer [

	^ playerPositions at: aPlayer
]

{ #category : #initialization }
EffectTargetTest >> setUp [

	moveOneTile := MovePlayer movingForward: 1.
	player1 := 'Player 1'.
	player2 := 'Player 2'.
	player3 := 'Player 3'.
	playerPositions := ({player1.
	player2.
	player3} collect: [ :player | player -> (PlayerPosition startingOf: player) ]) asDictionary
]

{ #category : #tests }
EffectTargetTest >> testAffectEveryone [

	self assert: player1 isOnLap: 0 tileNumber: 1.
	self assert: player2 isOnLap: 0 tileNumber: 1.
	self assert: player3 isOnLap: 0 tileNumber: 1.
	AffectEveryone new apply: moveOneTile to: self becausePlayerLandedOn: (playerPositions at: player1).
	self assert: player1 isOnLap: 0 tileNumber: 2.
	self assert: player2 isOnLap: 0 tileNumber: 2.
	self assert: player3 isOnLap: 0 tileNumber: 2
]

{ #category : #tests }
EffectTargetTest >> testAffectEveryoneElse [

	self assert: player1 isOnLap: 0 tileNumber: 1.
	self assert: player2 isOnLap: 0 tileNumber: 1.
	self assert: player3 isOnLap: 0 tileNumber: 1.
	AffectEveryoneElse new apply: moveOneTile to: self becausePlayerLandedOn: (playerPositions at: player1).
	self assert: player1 isOnLap: 0 tileNumber: 1.
	self assert: player2 isOnLap: 0 tileNumber: 2.
	self assert: player3 isOnLap: 0 tileNumber: 2
]

{ #category : #tests }
EffectTargetTest >> testAffectPlayer [

	self assert: player1 isOnLap: 0 tileNumber: 1.
	self assert: player2 isOnLap: 0 tileNumber: 1.
	self assert: player3 isOnLap: 0 tileNumber: 1.
	AffectPlayer new apply: moveOneTile to: self becausePlayerLandedOn: (playerPositions at: player1).
	self assert: player1 isOnLap: 0 tileNumber: 2.
	self assert: player2 isOnLap: 0 tileNumber: 1.
	self assert: player3 isOnLap: 0 tileNumber: 1
]
