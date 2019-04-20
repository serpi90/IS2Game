Class {
	#name : #AffectEveryone,
	#superclass : #EffectTarget,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #visitor }
AffectEveryone >> accept: aVisitor [

	^ aVisitor acceptAffectEveryone: self
]

{ #category : #testing }
AffectEveryone >> appliesTo: aPlayer on: aGame [

	^ true
]

{ #category : #affecting }
AffectEveryone >> apply: anEffect to: aGame [

	aGame players do: [ :player | anEffect affectTurnOf: player on: aGame ]
]
