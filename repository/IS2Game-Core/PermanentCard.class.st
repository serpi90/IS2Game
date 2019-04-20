Class {
	#name : #PermanentCard,
	#superclass : #Object,
	#category : #'IS2Game-Core-Board'
}

{ #category : #visitor }
PermanentCard >> acceptAffectEveryone: anAffectEveryone [

	
]

{ #category : #visitor }
PermanentCard >> acceptAffectSpecificPlayer: anAffectSpecificPlayer [

	
]

{ #category : #affecting }
PermanentCard >> assertValidTarget: aTarget [

	aTarget accept: self
]

{ #category : #affecting }
PermanentCard >> effectAffecting: aTarget [

	^ self subclassResponsibility
]
