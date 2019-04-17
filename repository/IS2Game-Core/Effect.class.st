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

	^ self
		named: 'Atomic Bomb'
		affecting: AffectEveryone new
		doing: ( RepositionPlayer toLap: 0 tileNumber: 1 )
]

{ #category : #'well known effects' }
Effect class >> moonwalkGoingBack: aNumberOfTiles [

	^ self
		named: 'Moonwalk'
		affecting: AffectEveryoneElse new
		doing: ( MovePlayer goingBack: aNumberOfTiles )
]

{ #category : #'instance creation' }
Effect class >> named: aName affecting: aTarget doing: anAction [

	^ self new initializeNamed: aName affecting: aTarget doing: anAction
]

{ #category : #'well known effects' }
Effect class >> none [

	^ self named: 'Empty' affecting: AffectCurrentPlayer new doing: NoEffect new
]

{ #category : #'well known effects' }
Effect class >> speedUp [

	^ self named: 'Speed Up' affecting: AffectCurrentPlayer new doing: ( MovePlayer movingForward: 4 )
]

{ #category : #'well known effects' }
Effect class >> timeMachine [

	^ self named: 'Time Machine' affecting: AffectCurrentPlayer new doing: ( UndoTurn goingBack: 1 )
]

{ #category : #'well known effects' }
Effect class >> wormhole [

	^ self named: 'Wormhole' affecting: AffectCurrentPlayer new doing: ( MovePlayer goingBack: 4 )
]

{ #category : #affecting }
Effect >> affectRoll: aDiceRoll of: aPlayer on: aGame [

	^ ( target appliesTo: aPlayer on: aGame )
		ifTrue: [ action affectRoll: aDiceRoll ]
		ifFalse: [ aDiceRoll ]
]

{ #category : #affecting }
Effect >> affectTurnOf: aPlayer in: aGame [

	target apply: action to: aGame
]

{ #category : #testing }
Effect >> appliesTo: aPlayer on: aGame [

	^ target appliesTo: aPlayer on: aGame
]

{ #category : #initialization }
Effect >> initializeNamed: aName affecting: aTarget doing: anAction [

	name := aName.
	target := aTarget.
	action := anAction
]

{ #category : #accessing }
Effect >> name [

	^ name
]

{ #category : #printing }
Effect >> printOn: aStream [

	aStream nextPutAll: name
]
