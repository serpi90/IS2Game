Class {
	#name : #MovePlayer,
	#superclass : #EffectAction,
	#instVars : [
		'tilesToMove'
	],
	#category : 'IS2Game-Core-Effect'
}

{ #category : #'instance creation' }
MovePlayer class >> goingBack: aNumberOfTiles [

	^ self movingForward: aNumberOfTiles negated
]

{ #category : #'instance creation' }
MovePlayer class >> movingForward: aNumberOfTiles [

	AssertionChecker enforce: [ aNumberOfTiles ~= 0 ] because: 'Move effect can not be 0' raising: InstanceCreationFailed.
	^ self new initializeMovingForward: aNumberOfTiles
]

{ #category : #affecting }
MovePlayer >> affectTurnOf: aPlayer on: aGame [

	aGame move: aPlayer tiles: tilesToMove
]

{ #category : #initialization }
MovePlayer >> initializeMovingForward: aNumberOfTiles [

	tilesToMove := aNumberOfTiles
]

{ #category : #printing }
MovePlayer >> printOn: aStream [

	aStream
		nextPutAll:
			((tilesToMove positive
				ifTrue: [ 'Move forward <1p> tile<2s>' ]
				ifFalse: [ 'Go back <1p> tile<2s>' ])
				expandMacrosWith: tilesToMove abs
				with:
					(tilesToMove abs = 1
						ifTrue: [ '' ]
						ifFalse: [ 's' ]))
]
