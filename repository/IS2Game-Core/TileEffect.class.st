Class {
	#name : #TileEffect,
	#superclass : #Object,
	#instVars : [
		'effect',
		'triggeringPlayer'
	],
	#category : #'IS2Game-Core-Cards'
}

{ #category : #'instance creation' }
TileEffect class >> applying: anEffect triggeredBy: aPlayer [

	^ self new initializeApplying: anEffect triggeredBy: aPlayer
]

{ #category : #accessing }
TileEffect >> effect [

	^ effect
]

{ #category : #initialization }
TileEffect >> initializeApplying: anEffect triggeredBy: aPlayer [

	effect := anEffect.
	triggeringPlayer := aPlayer
]

{ #category : #accessing }
TileEffect >> triggeringPlayer [

	^ triggeringPlayer
]
