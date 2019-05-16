Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IS2Game-Core-Board'
}

{ #category : #visitor }
Card >> acceptAffectEveryone: anAffectEveryone [

	self subclassResponsibility
]

{ #category : #visitor }
Card >> acceptAffectSpecificTarget: anAffectSpecificTarget [

	self subclassResponsibility
]

{ #category : #affecting }
Card >> assertValidTarget: aTarget [

	aTarget accept: self
]

{ #category : #private }
Card >> basicBePlayedOn: aGame by: aPlayer over: anEffectTarget [

	self subclassResponsibility
]

{ #category : #'game - double dispatch' }
Card >> bePlayedOn: aGame by: aPlayer over: anEffectTarget [

	self assertValidTarget: anEffectTarget.
	self basicBePlayedOn: aGame by: aPlayer over: anEffectTarget
]
