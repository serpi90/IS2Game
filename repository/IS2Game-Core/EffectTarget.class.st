Class {
	#name : #EffectTarget,
	#superclass : #Object,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #testing }
EffectTarget >> appliesTo: aPlayer on: aGame [

	self subclassResponsibility
]

{ #category : #affecting }
EffectTarget >> apply: anEffect to: aGame [

	self subclassResponsibility
]
