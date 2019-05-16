"
An EffectTargetTest is a test class for testing the behavior of EffectTarget
"
Class {
	#name : #EffectTargetTest,
	#superclass : #TestCase,
	#instVars : [
		'moveOneTile',
		'playerPositions',
		'currentPlayer',
		'anotherPlayer',
		'yetAnotherPlayer'
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

{ #category : #mocking }
EffectTargetTest >> currentPlayer [

	^ currentPlayer
]

{ #category : #asserting }
EffectTargetTest >> move: aPlayer tiles: aNumberOfTiles [

	| position |

	position := playerPositions at: aPlayer.
	playerPositions
		at: aPlayer
		put:
			( PlayerPosition
				of: position player
				onLap: position lap
				tileNumber: position tileNumber + aNumberOfTiles )
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
	currentPlayer := 'Player 1'.
	anotherPlayer := 'Player 2'.
	yetAnotherPlayer := 'Player 3'.
	playerPositions := ( {currentPlayer.
	anotherPlayer.
	yetAnotherPlayer} collect: [ :player | player -> ( PlayerPosition startingOf: player ) ] )
		asDictionary
]

{ #category : #tests }
EffectTargetTest >> testAffectCurrentPlayer [

	| target |

	target := AffectCurrentPlayer new.
	self assert: ( target appliesTo: currentPlayer on: self ).
	self deny: ( target appliesTo: anotherPlayer on: self ).
	self deny: ( target appliesTo: yetAnotherPlayer on: self ).

	self assert: currentPlayer isOnLap: 0 tileNumber: 1.
	self assert: anotherPlayer isOnLap: 0 tileNumber: 1.
	self assert: yetAnotherPlayer isOnLap: 0 tileNumber: 1.
	target apply: moveOneTile to: self.
	self assert: currentPlayer isOnLap: 0 tileNumber: 2.
	self assert: anotherPlayer isOnLap: 0 tileNumber: 1.
	self assert: yetAnotherPlayer isOnLap: 0 tileNumber: 1
]

{ #category : #tests }
EffectTargetTest >> testAffectEveryone [

	| target |

	target := AffectEveryone new.
	self assert: ( target appliesTo: currentPlayer on: self ).
	self assert: ( target appliesTo: anotherPlayer on: self ).
	self assert: ( target appliesTo: yetAnotherPlayer on: self ).

	self assert: currentPlayer isOnLap: 0 tileNumber: 1.
	self assert: anotherPlayer isOnLap: 0 tileNumber: 1.
	self assert: yetAnotherPlayer isOnLap: 0 tileNumber: 1.

	target apply: moveOneTile to: self.
	self assert: currentPlayer isOnLap: 0 tileNumber: 2.
	self assert: anotherPlayer isOnLap: 0 tileNumber: 2.
	self assert: yetAnotherPlayer isOnLap: 0 tileNumber: 2
]

{ #category : #tests }
EffectTargetTest >> testAffectEveryoneElse [

	| target |

	target := AffectEveryoneElse new.
	self deny: ( target appliesTo: currentPlayer on: self ).
	self assert: ( target appliesTo: anotherPlayer on: self ).
	self assert: ( target appliesTo: yetAnotherPlayer on: self ).

	self assert: currentPlayer isOnLap: 0 tileNumber: 1.
	self assert: anotherPlayer isOnLap: 0 tileNumber: 1.
	self assert: yetAnotherPlayer isOnLap: 0 tileNumber: 1.
	target apply: moveOneTile to: self.
	self assert: currentPlayer isOnLap: 0 tileNumber: 1.
	self assert: anotherPlayer isOnLap: 0 tileNumber: 2.
	self assert: yetAnotherPlayer isOnLap: 0 tileNumber: 2
]

{ #category : #tests }
EffectTargetTest >> testAffectSpecificPlayer [

	| target |

	target := AffectSpecificTarget targeting: anotherPlayer.
	self deny: ( target appliesTo: currentPlayer on: self ).
	self assert: ( target appliesTo: anotherPlayer on: self ).
	self deny: ( target appliesTo: yetAnotherPlayer on: self ).

	self assert: currentPlayer isOnLap: 0 tileNumber: 1.
	self assert: anotherPlayer isOnLap: 0 tileNumber: 1.
	self assert: yetAnotherPlayer isOnLap: 0 tileNumber: 1.
	target apply: moveOneTile to: self.
	self assert: currentPlayer isOnLap: 0 tileNumber: 1.
	self assert: anotherPlayer isOnLap: 0 tileNumber: 2.
	self assert: yetAnotherPlayer isOnLap: 0 tileNumber: 1
]
