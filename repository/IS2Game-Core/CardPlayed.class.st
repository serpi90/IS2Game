Class {
	#name : #CardPlayed,
	#superclass : #Object,
	#instVars : [
		'card',
		'target'
	],
	#category : #'IS2Game-Core-Game'
}

{ #category : #'instance creation' }
CardPlayed class >> card: aCard over: aTarget [

	^ self new initializeCard: aCard over: aTarget
]

{ #category : #accessing }
CardPlayed >> card [

	^ card
]

{ #category : #initialization }
CardPlayed >> initializeCard: aCard over: aTarget [

	card := aCard.
	target := aTarget
]

{ #category : #printing }
CardPlayed >> printOn: aStream [

	aStream nextPutAll: ( '<1p> over <2p>' expandMacrosWith: card with: target )
]
