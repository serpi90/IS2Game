Class {
	#name : #AffectSpecificPlayer,
	#superclass : #EffectTarget,
	#instVars : [
		'target'
	],
	#category : 'IS2Game-Core-Effect'
}

{ #category : #'instance creation' }
AffectSpecificPlayer class >> targeting: aPlayer [

	^ self new initializeTargeting: aPlayer
]

{ #category : #testing }
AffectSpecificPlayer >> appliesTo: aPlayer on: aGame [

	^ aPlayer = target
]

{ #category : #affecting }
AffectSpecificPlayer >> apply: anEffect to: aGame [

	anEffect affectTurnOf: target on: aGame
]

{ #category : #initialization }
AffectSpecificPlayer >> initializeTargeting: aPlayer [

	target := aPlayer
]
