Class {
	#name : #MultiplyEffect,
	#superclass : #Object,
	#instVars : [
		'multiplier'
	],
	#category : 'IS2Game-Core-Effect'
}

{ #category : #'well known cards' }
MultiplyEffect class >> by: aMultiplier [

	^ self new initializeMultipliedBy: aMultiplier
]

{ #category : #affecting }
MultiplyEffect >> affectGame: aGame [

	^ GameWithMultipliedMovements on: aGame by: multiplier
]

{ #category : #affecting }
MultiplyEffect >> affectRoll: aDiceRoll [

	^ aDiceRoll
]

{ #category : #initialization }
MultiplyEffect >> initializeMultipliedBy: aMultiplier [

	multiplier := aMultiplier
]
