Class {
	#name : #AffectEveryone,
	#superclass : #EffectTarget,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #affecting }
AffectEveryone >> apply: anEffect to: aGame becausePlayerLandedOn: aPlayerPosition [

	aGame players do: [ :player | anEffect affectPlayerFrom: (aGame positionOf: player) on: aGame ]
]
