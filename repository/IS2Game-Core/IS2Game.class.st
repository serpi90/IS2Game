Class {
	#name : #IS2Game,
	#superclass : #Object,
	#instVars : [
		'laps',
		'dice',
		'players',
		'playerPositions',
		'board',
		'playerTurn'
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
				enforce: [ somePlayers notEmpty ] because: 'A game must at least have one player' ];
		buildAndCheck.
	^ self new
		initializeWithBoard: aBoard
		laps: aNumberOfLaps
		dice: aDice
		for: somePlayers
]

{ #category : #private }
IS2Game >> applyTileEfectOn: aPlayerPosition [

	(board tileNumbered: aPlayerPosition tileNumber) effect
		affect: self
		becausePlayerLandedOn: aPlayerPosition
]

{ #category : #private }
IS2Game >> assertCanPlay: aPlayer [

	AssertionCheckerBuilder new
		checking: [ :asserter | 
			asserter
				refuse: [ self hasEnded ] because: ('<1s> can not play now, the game has ended' expandMacrosWith: aPlayer);
				enforce: [ aPlayer = playerTurn current ] because: ('<1s> can not play now, it''s <2s>''s turn' expandMacrosWith: aPlayer with: playerTurn current) ];
		buildAndCheck
]

{ #category : #testing }
IS2Game >> hasEnded [

	^ playerPositions last lap >= laps
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
	playerPositions := (players
		collect: [ :player | PlayerPosition startingOf: player ])
		asOrderedCollection
]

{ #category : #playing }
IS2Game >> move: aPlayer tiles: aNumberOfTiles [

	| newPosition |

	newPosition := self positionFor: (self positionOf: aPlayer) whenMoving: aNumberOfTiles.

	self move: aPlayer to: newPosition
]

{ #category : #playing }
IS2Game >> move: aPlayer to: aPlayerPosition [

	playerPositions add: aPlayerPosition
]

{ #category : #playing }
IS2Game >> playTurnFor: aPlayer [

	self assertCanPlay: aPlayer.
	self move: aPlayer tiles: dice roll.
	self applyTileEfectOn: (self positionOf: aPlayer).
	playerTurn next
]

{ #category : #accessing }
IS2Game >> players [

	^ players
]

{ #category : #accessing }
IS2Game >> positionFor: aPlayerPosition whenMoving: aNumberOfTiles [

	| totalMoves |

	totalMoves := aPlayerPosition lap * board length
		+ aPlayerPosition tileNumber - 1 + aNumberOfTiles.
	^ PlayerPosition
		of: aPlayerPosition player
		onLap: (totalMoves quo: board length)
		tileNumber: (totalMoves rem: board length) + 1
]

{ #category : #accessing }
IS2Game >> positionOf: aPlayer [

	^ (self historyFor: aPlayer) last
]

{ #category : #accessing }
IS2Game >> winner [

	AssertionChecker enforce: [ self hasEnded ] because: 'Can not define a winner until game has ended'.
	^ playerPositions last player
]
