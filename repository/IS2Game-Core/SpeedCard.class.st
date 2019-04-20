Class {
	#name : #SpeedCard,
	#superclass : #PermanentCard,
	#category : #'IS2Game-Core-Board'
}

{ #category : #visitor }
SpeedCard >> acceptAffectEveryone: aTarget [

	AssertionFailed signal: 'Speed is a targeted card, can not be played over everybody'
]

{ #category : #affecting }
SpeedCard >> effectAffecting: aTarget [

	self assertValidTarget: aTarget.
	^ Effect named: 'Speed' affecting: aTarget doing: ( ModifyRoll increaseBy: 1 )
]
