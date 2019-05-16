Class {
	#name : #PermanentCard,
	#superclass : #Card,
	#category : #'IS2Game-Core-Board'
}

{ #category : #visitor }
PermanentCard >> acceptAffectEveryone: anAffectEveryone [

	self subclassResponsibility
]

{ #category : #visitor }
PermanentCard >> acceptAffectSpecificTarget: anAffectSpecificTarget [

	self subclassResponsibility
]

{ #category : #private }
PermanentCard >> basicBePlayedOn: aGame by: aPlayer over: anEffectTarget [

	aGame playPermanent: self by: aPlayer over: anEffectTarget
]

{ #category : #accessing }
PermanentCard >> effectAffecting: anEffectTarget [

	^ self subclassResponsibility
]
