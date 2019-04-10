Class {
	#name : #RepositionPlayer,
	#superclass : #EffectAction,
	#instVars : [
		'lap',
		'tileNumber'
	],
	#category : 'IS2Game-Core-Effect'
}

{ #category : #'instance creation' }
RepositionPlayer class >> toLap: aLap tileNumber: aNumberOfTiles [

	^ self new initializeRepositioningToLap: aLap tileNumber: aNumberOfTiles
]

{ #category : #affecting }
RepositionPlayer >> affectTurnOf: aPlayer on: aGame [

	aGame
		addPosition: (PlayerPosition of: aPlayer onLap: lap tileNumber: tileNumber)
]

{ #category : #initialization }
RepositionPlayer >> initializeRepositioningToLap: aLap tileNumber: aNumberOfTiles [

	lap := aLap.
	tileNumber := aNumberOfTiles
]

{ #category : #printing }
RepositionPlayer >> printOn: aStream [

	aStream nextPutAll: ('Go to lap <1p> tile <2p>' expandMacrosWith: lap with: tileNumber)
]
