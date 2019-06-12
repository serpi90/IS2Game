Class {
	#name : #OverloadCard,
	#superclass : #PermanentCard,
	#category : #'IS2Game-Core-Cards'
}

{ #category : #visitor }
OverloadCard >> acceptAffectEveryone: aTarget [

	AssertionFailed signal: 'Overload is a targeted card, can not be played over everybody'
]

{ #category : #visitor }
OverloadCard >> acceptAffectSpecificTarget: anAffectSpecificTarget [

	
]

{ #category : #accessing }
OverloadCard >> effectAffecting: aTarget [

	^ Effect named: 'Overload' affecting: aTarget doing: ( ModifyRoll decreaseBy: 2 )
]
