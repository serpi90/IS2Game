Class {
	#name : #SpeedCard,
	#superclass : #PermanentCard,
	#category : #'IS2Game-Core-Cards'
}

{ #category : #visitor }
SpeedCard >> acceptAffectEveryone: aTarget [

	AssertionFailed signal: 'Speed is a targeted card, can not be played over everybody'
]

{ #category : #visitor }
SpeedCard >> acceptAffectSpecificTarget: anAffectSpecificTarget [

	
]

{ #category : #accessing }
SpeedCard >> effectAffecting: aTarget [

	^ Effect named: 'Speed' affecting: aTarget doing: ( ModifyRoll increaseBy: 1 )
]
