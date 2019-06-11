Class {
	#name : #RepeatCard,
	#superclass : #InstantCard,
	#category : #'IS2Game-Core-Board'
}

{ #category : #visitor }
RepeatCard >> acceptAffectEveryone: anAffectEveryone [

	
]

{ #category : #visitor }
RepeatCard >> acceptAffectSpecificTarget: anAffectSpecificTarget [

	AssertionFailed signal: 'Repeat can not be played over a specific target'
]

{ #category : #affecting }
RepeatCard >> affect: aTarget on: aGame [

	AssertionFailed signal: 'Repeat can not be played over a specific target'
]
