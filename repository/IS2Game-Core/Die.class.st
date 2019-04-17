Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'sides',
		'source'
	],
	#category : #'IS2Game-Core-Board'
}

{ #category : #'instance creation' }
Die class >> withSides: aNumberOfSides [

	^ self withSides: aNumberOfSides source: Random new
]

{ #category : #'instance creation' }
Die class >> withSides: aNumberOfSides source: aNumberSource [

	AssertionChecker
		enforce: [ aNumberOfSides >= 2 ]
		because: 'A dice must at least have 2 sides'
		raising: InstanceCreationFailed.
	^ self new initializeWithSides: aNumberOfSides source: aNumberSource
]

{ #category : #initialization }
Die >> initializeWithSides: aNumberOfSides source: aNumberSource [

	sides := aNumberOfSides.
	source := aNumberSource
]

{ #category : #printing }
Die >> printOn: aStream [

	aStream
		nextPutAll: '1d';
		print: sides
]

{ #category : #rolling }
Die >> roll [

	^ source nextInt: sides
]

{ #category : #accessing }
Die >> sides [

	^ sides
]
