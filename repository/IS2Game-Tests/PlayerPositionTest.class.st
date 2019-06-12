"
A PlayerPositionTest is a test class for testing the behavior of PlayerPosition
"
Class {
	#name : #PlayerPositionTest,
	#superclass : #TestCase,
	#category : 'IS2Game-Tests'
}

{ #category : #accessing }
PlayerPositionTest >> emptyTiles: aNumberOfTiles [

	^ ( 1 to: aNumberOfTiles ) collect: [ :n | Tile withoutEffect ]
]

{ #category : #tests }
PlayerPositionTest >> testPositionForBorderCaseWithBoardLengthedOne [

	| position newPosition singleTileBoard |

	singleTileBoard := Board withTiles: {Tile withoutEffect}.
	position := PlayerPosition startingOf: 'bob'.
	newPosition := PlayerPosition offsetFrom: position whenMoving: 1 on: singleTileBoard.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 1.

	newPosition := PlayerPosition offsetFrom: position whenMoving: 2 on: singleTileBoard.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 2
]

{ #category : #tests }
PlayerPositionTest >> testPositionForWhenChangingLap [

	| position newPosition board |

	board := Board withTiles: ( self emptyTiles: 10 ).
	position := PlayerPosition of: 'bob' onLap: 0 tileNumber: 10.
	newPosition := PlayerPosition offsetFrom: position whenMoving: 1 on: board.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 1.

	position := PlayerPosition of: 'bob' onLap: 0 tileNumber: 5.
	newPosition := PlayerPosition offsetFrom: position whenMoving: 21 on: board.
	self assert: newPosition tileNumber equals: 6.
	self assert: newPosition lap equals: 2.

	position := PlayerPosition of: 'bob' onLap: 2 tileNumber: 6.
	newPosition := PlayerPosition offsetFrom: position whenMoving: 5 on: board.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 3
]

{ #category : #tests }
PlayerPositionTest >> testPositionForWhenChangingLapBackwards [

	| position newPosition board |

	board := Board withTiles: ( self emptyTiles: 10 ).
	position := PlayerPosition startingOf: 'bob'.
	newPosition := PlayerPosition offsetFrom: position whenMoving: -1 on: board.
	self assert: newPosition tileNumber equals: 10.
	self assert: newPosition lap equals: -1
]

{ #category : #tests }
PlayerPositionTest >> testPositionForWhenMoving [

	| position newPosition board |

	board := Board withTiles: ( self emptyTiles: 5 ).

	position := PlayerPosition startingOf: 'bob'.
	newPosition := PlayerPosition offsetFrom: position whenMoving: 2 on: board.
	self assert: newPosition tileNumber equals: 3.
	self assert: newPosition lap equals: 0.
	newPosition := PlayerPosition offsetFrom: position whenMoving: 6 on: board.
	self assert: newPosition tileNumber equals: 2.
	self assert: newPosition lap equals: 1.

	position := PlayerPosition of: 'bob' onLap: 3 tileNumber: 4.
	newPosition := PlayerPosition offsetFrom: position whenMoving: 1 on: board.
	self assert: newPosition tileNumber equals: 5.
	self assert: newPosition lap equals: 3.
	newPosition := PlayerPosition offsetFrom: position whenMoving: 2 on: board.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 4
]

{ #category : #tests }
PlayerPositionTest >> testPositionForWhenNotChangingLap [

	| position newPosition board |

	board := Board withTiles: ( self emptyTiles: 10 ).

	position := PlayerPosition startingOf: 'bob'.
	newPosition := PlayerPosition offsetFrom: position whenMoving: 1 on: board.
	self assert: newPosition tileNumber equals: 2.
	self assert: newPosition lap equals: 0.

	position := PlayerPosition of: 'bob' onLap: 2 tileNumber: 5.
	newPosition := PlayerPosition offsetFrom: position whenMoving: 3 on: board.
	self assert: newPosition tileNumber equals: 8.
	self assert: newPosition lap equals: 2.

	position := PlayerPosition of: 'bob' onLap: 2 tileNumber: 3.
	newPosition := PlayerPosition offsetFrom: position whenMoving: 5 on: board.
	self assert: newPosition tileNumber equals: 8.
	self assert: newPosition lap equals: 2
]

{ #category : #tests }
PlayerPositionTest >> testPrintOn [

	self assert: ( PlayerPosition startingOf: 'Nobody' ) printString equals: 'Nobody Tile: 1 Lap: 0'.
	self
		assert: ( PlayerPosition of: 'Somebody' onLap: 3 tileNumber: 15 ) printString
		equals: 'Somebody Tile: 15 Lap: 3'
]
