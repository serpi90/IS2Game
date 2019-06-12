Class {
	#name : #EffectAction,
	#superclass : #Object,
	#category : #'IS2Game-Core-Effects'
}

{ #category : #affecting }
EffectAction >> affect: aTarget on: aGame [

	self subclassResponsibility
]
