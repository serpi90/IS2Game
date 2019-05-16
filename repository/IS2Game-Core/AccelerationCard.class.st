Class {
	#name : #AccelerationCard,
	#superclass : #PermanentCard,
	#category : #'IS2Game-Core-Board'
}

{ #category : #visitor }
AccelerationCard >> acceptAffectSpecificTarget: aTarget [

	AssertionFailed signal: 'Acceleration is a global card, can not be played over a player'
]

{ #category : #affecting }
AccelerationCard >> basicEffectAffecting: aTarget [

	^ Effect named: 'Acceleration' affecting: aTarget doing: ( ModifyRoll increaseBy: 1 )
]
