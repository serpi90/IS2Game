Class {
	#name : #InstantCard,
	#superclass : #Card,
	#category : #'IS2Game-Core-Board'
}

{ #category : #private }
InstantCard >> basicPlayedBy: aPlayer over: aTarget on: aGame [

	aGame playInstant: self by: aPlayer over: aTarget
]
