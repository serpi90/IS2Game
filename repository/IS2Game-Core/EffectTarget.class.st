Class {
	#name : #EffectTarget,
	#superclass : #Object,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #affecting }
EffectTarget >> apply: anEffect to: aGame becausePlayerLandedOn: aPlayerPosition [

	self subclassResponsibility
]
