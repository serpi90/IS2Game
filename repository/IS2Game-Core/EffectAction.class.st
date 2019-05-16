Class {
	#name : #EffectAction,
	#superclass : #Object,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #affecting }
EffectAction >> affect: aTarget on: aGame [

	self subclassResponsibility
]
