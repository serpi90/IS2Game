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
Tile class >> numbered: aNumber [

	^ self numbered: aNumber withEffect: Effect none
]

{ #category : #'instance creation' }
Tile class >> numbered: aNumber withEffect: anEffect [

	^ self new initializeNumbered: aNumber withEffect: anEffect
]

{ #category : #accessing }
Tile >> effect [

	^ effect
]

{ #category : #initialization }
Tile >> initializeNumbered: aNumber withEffect: anEffect [

	number := aNumber.
	effect := anEffect
]

{ #category : #initialization }
Tile >> number [

	^ number
]
