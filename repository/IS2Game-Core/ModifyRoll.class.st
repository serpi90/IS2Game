Class {
	#name : #ModifyRoll,
	#superclass : #Object,
	#instVars : [
		'change'
	],
	#category : #'IS2Game-Core-Effects'
}

{ #category : #'instance creation' }
ModifyRoll class >> decreaseBy: anInteger [

	^ self increaseBy: anInteger negated
]

{ #category : #'instance creation' }
ModifyRoll class >> increaseBy: anInteger [

	^ self new initializeModifyingRollBy: anInteger
]

{ #category : #affecting }
ModifyRoll >> affectRoll: aDiceroll [

	^ aDiceroll + change
]

{ #category : #initialization }
ModifyRoll >> initializeModifyingRollBy: anInteger [

	change := anInteger
]

{ #category : #printing }
ModifyRoll >> printOn: aStream [

	aStream
		nextPutAll: 'Modify roll by: ';
		print: change
]
