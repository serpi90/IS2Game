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

{ #category : #accessing }
RepositionPlayer >> affectPlayerFrom: aPlayerPosition on: aGame [

	aGame move: aPlayerPosition player to: (PlayerPosition of: aPlayerPosition player onLap: lap tileNumber: tileNumber)
]

{ #category : #initialization }
RepositionPlayer >> initializeRepositioningToLap: aLap tileNumber: aNumberOfTiles [

	lap := aLap.
	tileNumber := aNumberOfTiles
]

{ #category : #accessing }
RepositionPlayer >> printOn: aStream [

	aStream nextPutAll: ('Go to lap <1p> tile <2p>' expandMacrosWith: lap with: tileNumber)
]
