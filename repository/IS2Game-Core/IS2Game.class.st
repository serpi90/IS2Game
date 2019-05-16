Class {
	#name : #IS2Game,
	#superclass : #Object,
	#instVars : [
		'laps',
		'dice',
		'players',
		'playerPositions',
		'board',
		'playerTurn',
		'permanentEffects',
		'status'
	],
	#category : 'IS2Game-Core-Game'
}

{ #category : #'instance creation' }
IS2Game class >> withBoard: aBoard laps: aNumberOfLaps dice: aDice for: somePlayers [

	AssertionCheckerBuilder new
		raising: InstanceCreationFailed;
		checking: [ :asserter | 
			asserter
				enforce: [ aNumberOfLaps > 0 ] because: 'A game must at least have one lap';
				enforce: [ somePlayers notEmpty ] because: 'A game must at least have one player'
			];
		buildAndCheck.
	^ self new
		initializeWithBoard: aBoard
		laps: aNumberOfLaps
		dice: aDice
		for: somePlayers
]

{ #category : #playing }
IS2Game >> addPosition: aPlayerPosition [

	playerPositions add: aPlayerPosition.
	aPlayerPosition lap >= laps
		ifTrue: [ status := GameEnded wonBy: aPlayerPosition player ]
]

{ #category : #private }
IS2Game >> adjustedRollFor: aPlayer whenRolled: aDiceRoll [

	^ ( permanentEffects select: [ :effect | effect appliesTo: aPlayer on: self ] )
		inject: aDiceRoll
		into: [ :roll :effect | effect affectRoll: roll of: aPlayer on: self ]
]

{ #category : #private }
IS2Game >> applyTileEfectOn: aPlayerPosition [

	( board tileNumbered: aPlayerPosition tileNumber ) effect
		affectTurnOf: aPlayerPosition player
		in: self
]

{ #category : #accessing }
IS2Game >> cardsAffecting: aPlayer [

	^ permanentEffects keys
		select: [ :card | ( permanentEffects at: card ) appliesTo: aPlayer on: self ]
]

{ #category : #accessing }
IS2Game >> currentPlayer [

	^ status currentPlayer
]

{ #category : #testing }
IS2Game >> hasEnded [

	^ status hasEnded
]

{ #category : #accessing }
IS2Game >> historyFor: aPlayer [

	^ playerPositions select: [ :position | position player = aPlayer ]
]

{ #category : #initialization }
IS2Game >> initializeWithBoard: aBoard laps: aNumberOfLaps dice: aDice for: somePlayers [

	board := aBoard.
	laps := aNumberOfLaps.
	dice := aDice.
	players := somePlayers.
	playerTurn := CircularIterator cyclingOver: somePlayers.
	status := PlayerTurn currentOf: playerTurn current.
	playerPositions := ( players collect: [ :player | PlayerPosition startingOf: player ] )
		asOrderedCollection.
	permanentEffects := Dictionary new
]

{ #category : #playing }
IS2Game >> move: aPlayer tiles: aNumberOfTiles [

	| newPosition |

	newPosition := self positionFor: ( self positionOf: aPlayer ) whenMoving: aNumberOfTiles.

	self addPosition: newPosition
]

{ #category : #playing }
IS2Game >> playCard: aCard for: aPlayer [

	aCard bePlayedOn: self by: aPlayer over: AffectEveryone new
]

{ #category : #playing }
IS2Game >> playCard: aCard for: aPlayer over: aTargetPlayer [

	aCard bePlayedOn: self by: aPlayer over: ( AffectSpecificTarget targeting: aTargetPlayer )
]

{ #category : #playing }
IS2Game >> playInstant: anInstantCard by: aPlayer over: anEffectTarget [

	anInstantCard affect: anEffectTarget on: self
]

{ #category : #playing }
IS2Game >> playPermanent: aPermanentCard by: aPlayer over: target [

	status assertCanPlayPermanentCard: aPlayer.
	permanentEffects at: aPermanentCard put: ( aPermanentCard effectAffecting: target )
]

{ #category : #accessing }
IS2Game >> players [

	^ players
]

{ #category : #private }
IS2Game >> positionFor: aPlayerPosition whenMoving: aNumberOfTiles [

	| totalMoves |

	totalMoves := aPlayerPosition lap * board length + aPlayerPosition tileNumber - 1 + aNumberOfTiles.
	^ PlayerPosition
		of: aPlayerPosition player
		onLap: totalMoves // board length
		tileNumber: totalMoves \\ board length + 1
]

{ #category : #accessing }
IS2Game >> positionOf: aPlayer [

	^ ( self historyFor: aPlayer ) last
]

{ #category : #playing }
IS2Game >> removeActivePermanentCard: aPermanentCard [

	permanentEffects
		removeKey: aPermanentCard
		ifAbsent: [ AssertionFailed
				signal: ( '<1p> is not an active permanent card' expandMacrosWith: aPermanentCard ) ]
]

{ #category : #playing }
IS2Game >> rollDiceFor: aPlayer [

	| roll |

	status assertCanRollDice: aPlayer.
	roll := self adjustedRollFor: aPlayer whenRolled: dice roll.
	self move: aPlayer tiles: roll.
	self applyTileEfectOn: ( self positionOf: aPlayer ).
	status := status currentOf: playerTurn next
]

{ #category : #accessing }
IS2Game >> winner [

	^ status winner
]
