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
Card >> basicPlayedBy: aPlayer over: aTarget on: aGame [

	self subclassResponsibility
]

{ #category : #'game - double dispatch' }
Card >> playedBy: aPlayer over: aTarget on: aGame [

	self assertValidTarget: aTarget.
	self basicPlayedBy: aPlayer over: aTarget on: aGame
]
