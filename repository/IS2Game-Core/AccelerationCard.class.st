Class {
	#name : #AccelerationCard,
	#superclass : #PermanentCard,
	#category : #'IS2Game-Core-Cards'
}

{ #category : #visitor }
AccelerationCard >> acceptAffectEveryone: anAffectEveryone [

	
]

{ #category : #visitor }
AccelerationCard >> acceptAffectSpecificTarget: anAffectSpecificTarget [

	AssertionFailed signal: 'Acceleration is a global card, can not be played over a player'
]

{ #category : #accessing }
AccelerationCard >> effectAffecting: aTarget [

	^ Effect named: 'Acceleration' affecting: aTarget doing: ( ModifyRoll increaseBy: 1 )
]
