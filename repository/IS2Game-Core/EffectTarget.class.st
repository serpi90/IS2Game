Class {
	#name : #EffectTarget,
	#superclass : #Object,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #visitor }
EffectTarget >> accept: aVisitor [

	self subclassResponsibility
]

{ #category : #testing }
EffectTarget >> appliesTo: aPlayer on: aGame [

	self subclassResponsibility
]

{ #category : #affecting }
EffectTarget >> apply: anEffect to: aGame [

	self subclassResponsibility
]
