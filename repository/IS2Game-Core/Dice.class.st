Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'sides',
		'source'
	],
	#category : 'IS2Game-Core-Board'
}

{ #category : #'instance creation' }
Dice class >> withSides: anInteger [

	^ self withSides: anInteger source: Random new
]

{ #category : #'instance creation' }
Dice class >> withSides: anInteger source: aNumberSource [

	AssertionChecker
		enforce: [ anInteger >= 2 ]
		because: 'A dice must at least have 2 sides'
		raising: InstanceCreationFailed.
	^ self new initializeWithSides: anInteger source: aNumberSource
]

{ #category : #initialization }
Dice >> initializeWithSides: anInteger source: aNumberSource [

	sides := anInteger.
	source := aNumberSource
]

{ #category : #printing }
Dice >> printOn: aStream [

	aStream
		nextPutAll: '1d';
		print: sides
]

{ #category : #rolling }
Dice >> roll [

	^ source nextInt: sides
]

{ #category : #accessing }
Dice >> sides [

	^ sides
]
