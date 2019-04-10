"
A PlayerPositionTest is a test class for testing the behavior of PlayerPosition
"
Class {
	#name : #PlayerPositionTest,
	#superclass : #TestCase,
	#category : 'IS2Game-Tests'
}

{ #category : #'tests-printing' }
PlayerPositionTest >> testPrintOn [

	self assert: (PlayerPosition startingOf: 'Nobody') printString equals: 'Nobody Tile: 1 Lap: 0'.
	self assert: (PlayerPosition of: 'Somebody' onLap: 3 tileNumber: 15) printString equals: 'Somebody Tile: 15 Lap: 3'
]
