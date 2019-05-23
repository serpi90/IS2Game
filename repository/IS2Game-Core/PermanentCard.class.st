Class {
	#name : #PermanentCard,
	#superclass : #Card,
	#category : #'IS2Game-Core-Board'
}

{ #category : #private }
PermanentCard >> basicPlayedBy: aPlayer over: aTarget on: aGame [

	aGame playPermanent: self by: aPlayer over: aTarget
]

{ #category : #accessing }
PermanentCard >> effectAffecting: aTarget [

	^ self subclassResponsibility
]
