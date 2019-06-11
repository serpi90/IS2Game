Class {
	#name : #RepeatCard,
	#superclass : #InstantCard,
	#category : #'IS2Game-Core-Cards'
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

	| event |

	event := aGame history detectLast: [ :anEvent | anEvent isA: TileEffect ].
	event effect affectTurnOf: event triggeringPlayer in: aGame
]
