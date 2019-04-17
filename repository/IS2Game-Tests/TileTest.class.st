"
A TileTest is a test class for testing the behavior of Tile
"
Class {
	#name : #TileTest,
	#superclass : #TestCase,
	#instVars : [
		'moved'
	],
	#category : 'IS2Game-Tests'
}

{ #category : #mocking }
TileTest >> currentPlayer [

	^ self
]

{ #category : #mocking }
TileTest >> move: aPlayer tiles: aNumberOfTiles [

	moved := true
]

{ #category : #'tests-accessing' }
TileTest >> testEffect [

	| effect mockPosition tileWithEffect tileWithoutEffect |

	effect := Effect speedUp.
	mockPosition := PlayerPosition startingOf: self.
	tileWithEffect := Tile withEffect: effect.
	tileWithoutEffect := Tile withoutEffect.

	self assert: tileWithEffect effect equals: effect.

	moved := false.
	tileWithEffect effect affectTurnOf: mockPosition player in: self considering: #().
	self assert: moved.

	moved := false.
	tileWithoutEffect effect affectTurnOf: mockPosition player in: self considering: #().
	self deny: moved
]

{ #category : #'tests-accessing' }
TileTest >> testPrintOn [

	| effect |

	effect := Effect speedUp.
	self
		assert: ( Tile withEffect: effect ) printString
		equals: ( 'Tile <1p>' expandMacrosWith: effect )
]
