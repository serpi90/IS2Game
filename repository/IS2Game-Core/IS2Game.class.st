Class {
	#name : #IS2Game,
	#superclass : #Object,
	#instVars : [
		'laps',
		'dice',
		'players',
		'board',
		'permanentEffects',
		'status',
		'playingOrder'
	],
	#category : #'IS2Game-Core-Game'
}

{ #category : #'instance creation' }
IS2Game class >> withBoard: aBoard laps: aNumberOfLaps dice: aDice for: aCollectionOfPlayers [

	AssertionCheckerBuilder new
		raising: InstanceCreationFailed;
		checking: [ :asserter | 
			asserter
				enforce: [ aNumberOfLaps > 0 ] because: 'A game must at least have one lap';
				enforce: [ aCollectionOfPlayers notEmpty ] because: 'A game must at least have one player'
			];
		buildAndCheck.
	^ self new
		initializeWithBoard: aBoard
		laps: aNumberOfLaps
		dice: aDice
		for: aCollectionOfPlayers
]

{ #category : #playing }
IS2Game >> addPosition: aPlayerPosition [

	status registerPosition: aPlayerPosition.
	aPlayerPosition lap >= laps
		ifTrue: [ self changeStatusToWonBy: aPlayerPosition player ]
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

{ #category : #private }
IS2Game >> changeStatusToTurnOf: aPlayer [

	status := status currentOf: aPlayer
]

{ #category : #private }
IS2Game >> changeStatusToWonBy: aPlayer [

	status := GameEnded wonBy: aPlayer precededBy: status
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

	^ status historyFor: aPlayer
]

{ #category : #initialization }
IS2Game >> initializeWithBoard: aBoard laps: aNumberOfLaps dice: aDice for: aPlayerCollection [

	board := aBoard.
	laps := aNumberOfLaps.
	dice := aDice.
	players := aPlayerCollection.
	playingOrder := CircularIterator cyclingOver: aPlayerCollection.
	status := GameStarting forAll: players.
	permanentEffects := Dictionary new.
	self changeStatusToTurnOf: playingOrder current
]

{ #category : #playing }
IS2Game >> move: aPlayer tiles: aNumberOfTiles [

	| newPosition |

	newPosition := self positionFor: ( self positionOf: aPlayer ) whenMoving: aNumberOfTiles.

	self addPosition: newPosition
]

{ #category : #playing }
IS2Game >> playCard: aCard by: aPlayer [

	self playCard: aCard by: aPlayer targeting: AffectEveryone new
]

{ #category : #playing }
IS2Game >> playCard: aCard by: aPlayer over: anotherPlayer [

	self playCard: aCard by: aPlayer targeting: ( AffectSpecificTarget targeting: anotherPlayer )
]

{ #category : #playing }
IS2Game >> playCard: aCard by: aPlayer targeting: aTarget [

	aCard playedBy: aPlayer over: aTarget on: self
]

{ #category : #playing }
IS2Game >> playInstant: anInstantCard by: aPlayer over: aTarget [

	anInstantCard affect: aTarget on: self
]

{ #category : #playing }
IS2Game >> playPermanent: aPermanentCard by: aPlayer over: aTarget [

	status assertCanPlayPermanentCard: aPlayer.
	permanentEffects at: aPermanentCard put: ( aPermanentCard effectAffecting: aTarget )
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

	^ status positionOf: aPlayer
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
	self changeStatusToTurnOf: playingOrder next
]

{ #category : #accessing }
IS2Game >> winner [

	^ status winner
]
