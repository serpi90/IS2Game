Class {
	#name : #CancellationCard,
	#superclass : #InstantCard,
	#category : #'IS2Game-Core-Board'
}

{ #category : #visitor }
CancellationCard >> acceptAffectEveryone: anAffectEveryone [

	AssertionFailed signal: 'Cancellation must be played over a specific card'
]

{ #category : #visitor }
CancellationCard >> acceptAffectSpecificTarget: anAffectSpecificTarget [

	
]

{ #category : #affecting }
CancellationCard >> affect: aTarget on: aGame [

	aTarget apply: RemoveActivePermanentCard new to: aGame
]
