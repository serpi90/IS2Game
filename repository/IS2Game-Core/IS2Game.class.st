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
		considering: permanentEffects
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
	permanentEffects := OrderedCollection new
]

{ #category : #playing }
IS2Game >> move: aPlayer tiles: aNumberOfTiles [

	| newPosition |

	newPosition := self positionFor: ( self positionOf: aPlayer ) whenMoving: aNumberOfTiles.

	self addPosition: newPosition
]

{ #category : #playing }
IS2Game >> playCard: aCard for: aPlayer [

	self playPermanent: aCard by: aPlayer over: AffectEveryone new
]

{ #category : #playing }
IS2Game >> playCard: aCard for: aPlayer over: aTargetPlayer [

	self playPermanent: aCard by: aPlayer over: ( AffectSpecificPlayer targeting: aTargetPlayer )
]

{ #category : #playing }
IS2Game >> playPermanent: aCard by: aPlayer over: target [

	status assertCanPlayPermanentCard: aPlayer.
	permanentEffects add: ( aCard effectAffecting: target )
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
