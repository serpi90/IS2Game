Class {
	#name : #CancellationCard,
	#superclass : #Card,
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
CancellationCard >> affect: anEffectTarget on: aGame [

	anEffectTarget apply: RemoveActivePermanentCard new to: aGame
]

{ #category : #private }
CancellationCard >> basicBePlayedOn: aGame by: aPlayer over: anEffectTarget [

	aGame playInstant: self by: aPlayer over: anEffectTarget
]
