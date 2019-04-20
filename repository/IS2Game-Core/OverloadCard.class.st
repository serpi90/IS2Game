Class {
	#name : #OverloadCard,
	#superclass : #PermanentCard,
	#category : #'IS2Game-Core-Board'
}

{ #category : #visitor }
OverloadCard >> acceptAffectEveryone: aTarget [

	AssertionFailed signal: 'Overload is a targeted card, can not be played over everybody'
]

{ #category : #affecting }
OverloadCard >> effectAffecting: aTarget [

	self assertValidTarget: aTarget.
	^ Effect named: 'Overload' affecting: aTarget doing: ( ModifyRoll decreaseBy: 2 )
]
