Class {
	#name : #AffectSpecificTarget,
	#superclass : #EffectTarget,
	#instVars : [
		'target'
	],
	#category : #'IS2Game-Core-Effects'
}

{ #category : #'instance creation' }
AffectSpecificTarget class >> targeting: aTarget [

	^ self new initializeTargeting: aTarget
]

{ #category : #visitor }
AffectSpecificTarget >> accept: aVisitor [

	^ aVisitor acceptAffectSpecificTarget: self
]

{ #category : #testing }
AffectSpecificTarget >> appliesTo: aPlayer on: aGame [

	^ aPlayer = target
]

{ #category : #affecting }
AffectSpecificTarget >> apply: anEffect to: aGame [

	anEffect affect: target on: aGame
]

{ #category : #initialization }
AffectSpecificTarget >> initializeTargeting: aTarget [

	target := aTarget
]
