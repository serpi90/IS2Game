Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IS2Game-Core-Cards'
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
Card >> affect: aTarget on: aGame [

	self subclassResponsibility
]

{ #category : #asserting }
Card >> assertCanBePlayedBy: aPlayer onTurnOf: aCurrentPlayer [

	self subclassResponsibility
]

{ #category : #affecting }
Card >> assertValidTarget: aTarget [

	aTarget accept: self
]

{ #category : #playing }
Card >> playedBy: aPlayer over: aTarget on: aGame [

	self assertValidTarget: aTarget.
	self affect: aTarget on: aGame
]
