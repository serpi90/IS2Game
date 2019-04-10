Class {
	#name : #Tile,
	#superclass : #Object,
	#instVars : [
		'effect',
		'number'
	],
	#category : 'IS2Game-Core-Board'
}

{ #category : #'instance creation' }
Tile class >> withEffect: anEffect [

	^ self new initializeWithEffect: anEffect
]

{ #category : #'instance creation' }
Tile class >> withoutEffect [

	^ self withEffect: Effect none
]

{ #category : #accessing }
Tile >> effect [

	^ effect
]

{ #category : #initialization }
Tile >> initializeWithEffect: anEffect [

	effect := anEffect
]

{ #category : #printing }
Tile >> printOn: aStream [

	aStream
		nextPutAll: 'Tile';
		space;
		print: effect
]
