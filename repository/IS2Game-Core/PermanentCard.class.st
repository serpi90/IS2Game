Class {
	#name : #PermanentCard,
	#superclass : #Object,
	#category : #'IS2Game-Core-Board'
}

{ #category : #visitor }
PermanentCard >> acceptAffectEveryone: anAffectEveryone [

	
]

{ #category : #visitor }
PermanentCard >> acceptAffectSpecificTarget: anAffectSpecificPlayer [

	
]

{ #category : #affecting }
PermanentCard >> assertValidTarget: aTarget [

	aTarget accept: self
]

{ #category : #accessing }
PermanentCard >> basicEffectAffecting: arg1 [

	^ self subclassResponsibility
]

{ #category : #'game - double dispatch' }
PermanentCard >> bePlayedOn: aGame by: aPlayer over: anEffectTarget [

	aGame playPermanent: self by: aPlayer over: anEffectTarget
]

{ #category : #affecting }
PermanentCard >> effectAffecting: aTarget [

	self assertValidTarget: aTarget.
	^ self basicEffectAffecting: aTarget
]
