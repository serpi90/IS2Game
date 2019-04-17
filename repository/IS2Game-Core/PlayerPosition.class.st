Class {
	#name : #PlayerPosition,
	#superclass : #Object,
	#instVars : [
		'player',
		'lap',
		'tileNumber'
	],
	#category : 'IS2Game-Core-Game'
}

{ #category : #'instance creation' }
PlayerPosition class >> of: aPlayer onLap: aLap tileNumber: aTileNumber [

	^ self new initializeOf: aPlayer onLap: aLap tileNumber: aTileNumber
]

{ #category : #'instance creation' }
PlayerPosition class >> startingOf: aPlayer [

	^ self of: aPlayer onLap: 0 tileNumber: 1
]

{ #category : #initialization }
PlayerPosition >> initializeOf: aPlayer onLap: aLap tileNumber: aTileNumber [

	player := aPlayer.
	lap := aLap.
	tileNumber := aTileNumber
]

{ #category : #accessing }
PlayerPosition >> lap [

	^ lap
]

{ #category : #accessing }
PlayerPosition >> player [

	^ player
]

{ #category : #printing }
PlayerPosition >> printOn: aStream [

	aStream
		nextPutAll: ( '<1s> Tile: <2p> Lap: <3p>' expandMacrosWith: player with: tileNumber with: lap )
]

{ #category : #accessing }
PlayerPosition >> tileNumber [

	^ tileNumber
]
