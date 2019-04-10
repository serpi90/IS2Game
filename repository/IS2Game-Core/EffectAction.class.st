Class {
	#name : #EffectAction,
	#superclass : #Object,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #affecting }
EffectAction >> affectTurnOf: aPlayer on: aGame [

	self subclassResponsibility
]
