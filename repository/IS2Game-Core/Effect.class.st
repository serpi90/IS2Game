Class {
	#name : #Effect,
	#superclass : #Object,
	#instVars : [
		'name',
		'target',
		'action'
	],
	#category : 'IS2Game-Core-Effect'
}

{ #category : #'well known effects' }
Effect class >> atomicBomb [

	^ self named: 'Atomic Bomb' affecting: AffectEveryone new doing: (RepositionPlayer toLap: 0 tileNumber: 1)
]

{ #category : #'well known effects' }
Effect class >> moonwalkGoingBack: aNumberOfTiles [

	^ self named: 'Moonwalk' affecting: AffectEveryoneElse new doing: (MovePlayer goingBack: aNumberOfTiles)
]

{ #category : #'instance creation' }
Effect class >> named: aName affecting: aTarget doing: anAction [

	^ self new initializeNamed: aName affecting: aTarget doing: anAction
]

{ #category : #'well known effects' }
Effect class >> none [

	^ self named: 'Empty' affecting: AffectPlayer new doing: NoEffect new
]

{ #category : #'well known effects' }
Effect class >> speedUp [

	^ self named: 'Speed Up' affecting: AffectPlayer new doing: (MovePlayer movingForward: 4)
]

{ #category : #'well known effects' }
Effect class >> timeMachine [

	^ self named: 'Time Machine' affecting: AffectPlayer new doing: (UndoTurn goingBack: 1)
]

{ #category : #'well known effects' }
Effect class >> wormhole [

	^ self named: 'Wormhole' affecting: AffectPlayer new doing: (MovePlayer goingBack: 4)
]

{ #category : #affecting }
Effect >> affect: aGame becausePlayerLandedOn: aPlayerPosition [

	target apply: action to: aGame becausePlayerLandedOn: aPlayerPosition
]

{ #category : #initialization }
Effect >> initializeNamed: aName affecting: aTarget doing: anAction [

	name := aName.
	target := aTarget.
	action := anAction
]

{ #category : #printing }
Effect >> printOn: aStream [

	aStream nextPutAll: name
]
