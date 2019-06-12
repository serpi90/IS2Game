Class {
	#name : #PermanentCard,
	#superclass : #Card,
	#category : #'IS2Game-Core-Cards'
}

{ #category : #testing }
PermanentCard class >> isAbstract [

	<ignoreForCoverage>
	^ true
]

{ #category : #affecting }
PermanentCard >> affect: aTarget on: aGame [

	aGame activatePermanentCard: self withEffect: ( self effectAffecting: aTarget )
]

{ #category : #asserting }
PermanentCard >> assertCanBePlayedBy: aPlayer onTurnOf: aCurrentPlayer [

	aPlayer = aCurrentPlayer
		ifFalse: [ AssertionFailed
				signal: ( '<1s> can not play now, it''s <2s>''s turn' expandMacrosWith: aPlayer with: aCurrentPlayer )
			]
]

{ #category : #accessing }
PermanentCard >> effectAffecting: aTarget [

	^ self subclassResponsibility
]
