Class {
	#name : #AccelerationCard,
	#superclass : #PermanentCard,
	#category : #'IS2Game-Core-Board'
}

{ #category : #visitor }
AccelerationCard >> acceptAffectSpecificPlayer: aTarget [

	AssertionFailed signal: 'Acceleration is a global card, can not be played over a player'
]

{ #category : #affecting }
AccelerationCard >> effectAffecting: aTarget [

	self assertValidTarget: aTarget.
	^ Effect named: 'Acceleration' affecting: aTarget doing: ( ModifyRoll increaseBy: 1 )
]
