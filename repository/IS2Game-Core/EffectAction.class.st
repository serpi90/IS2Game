Class {
	#name : #EffectAction,
	#superclass : #Object,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #accessing }
EffectAction >> affectPlayerFrom: aPlayerPosition on: aGame [

	self subclassResponsibility
]
