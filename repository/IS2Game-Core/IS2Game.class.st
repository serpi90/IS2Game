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

{ #category : #effects }
IS2Game >> activatePermanentCard: aPermanentCard withEffect: anEffect [

	permanentEffects at: aPermanentCard put: anEffect
]

{ #category : #private }
IS2Game >> adjustedRollFor: aPlayer whenRolled: aDiceRoll [

	^ ( permanentEffects select: [ :effect | effect appliesTo: aPlayer on: self ] )
		inject: aDiceRoll
		into: [ :roll :effect | effect affectRoll: roll of: aPlayer on: self ]
]

{ #category : #private }
IS2Game >> applyTileEfectOn: aPlayerPosition [

	| effect |

	effect := ( board tileNumbered: aPlayerPosition tileNumber ) effect.
	status registerEvent: ( TileEffect applying: effect triggeredBy: aPlayerPosition player ).
	effect affectTurnOf: aPlayerPosition player in: self
]

{ #category : #accessing }
IS2Game >> cardsAffecting: aPlayer [

	^ permanentEffects keys
		select: [ :card | ( permanentEffects at: card ) appliesTo: aPlayer on: self ]
]

{ #category : #private }
IS2Game >> changeStatusToTurnOf: aPlayer [

	status := players
		detect: [ :player | ( self positionOf: player ) lap >= laps ]
		ifFound: [ :player | GameEnded wonBy: player precededBy: status ]
		ifNone: [ PlayerTurn currentOf: aPlayer precededBy: status ]
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
IS2Game >> history [

	^ status history
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

{ #category : #effects }
IS2Game >> move: aPlayer tiles: aNumberOfTiles [

	| newPosition |

	newPosition := PlayerPosition
		offsetFrom: ( self positionOf: aPlayer )
		whenMoving: aNumberOfTiles
		on: board.

	status registerEvent: newPosition
]

{ #category : #playing }
IS2Game >> playCard: aCard by: aPlayer [

	self playCard: aCard by: aPlayer targeting: AffectEveryone new
]

{ #category : #playing }
IS2Game >> playCard: aCard by: aPlayer over: aTarget [

	self playCard: aCard by: aPlayer targeting: ( AffectSpecificTarget targeting: aTarget )
]

{ #category : #playing }
IS2Game >> playCard: aCard by: aPlayer targeting: aTarget [

	status assert: aPlayer canPlayCard: aCard.
	status registerEvent: ( CardPlayed card: aCard over: aTarget ).
	aCard playedBy: aPlayer over: aTarget on: self
]

{ #category : #accessing }
IS2Game >> players [

	^ players
]

{ #category : #accessing }
IS2Game >> positionHistoryFor: aPlayer [

	^ status positionHistoryFor: aPlayer
]

{ #category : #accessing }
IS2Game >> positionOf: aPlayer [

	^ status positionOf: aPlayer
]

{ #category : #effects }
IS2Game >> registerEvent: aPlayerPosition [

	status registerEvent: aPlayerPosition
]

{ #category : #effects }
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
