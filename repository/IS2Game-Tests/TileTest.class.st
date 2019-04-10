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
TileTest >> move: aPlayer tiles: aNumberOfTiles [

	moved := true
]

{ #category : #'tests-accessing' }
TileTest >> testEffect [

	| effect mockPosition tileWithEffect tileWithoutEffect |

	effect := Effect speedUp.
	mockPosition := PlayerPosition startingOf: self.
	tileWithEffect := Tile numbered: 1 withEffect: effect.
	tileWithoutEffect := Tile numbered: 1.

	self assert: tileWithEffect effect equals: effect.

	moved := false.
	tileWithEffect effect affect: self becausePlayerLandedOn: mockPosition.
	self assert: moved.

	moved := false.
	tileWithoutEffect effect affect: self becausePlayerLandedOn: mockPosition.
	self deny: moved
]

{ #category : #'tests-initialization' }
TileTest >> testNumber [

	self assert: (Tile numbered: 1) number equals: 1.
	self assert: (Tile numbered: 2) number equals: 2
]
