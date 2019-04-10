Class {
	#name : #AffectEveryoneElse,
	#superclass : #EffectTarget,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #affecting }
AffectEveryoneElse >> apply: anEffect to: aGame becausePlayerLandedOn: aPlayerPosition [

	(aGame players copyWithout: aPlayerPosition player)
		do: [ :player | anEffect affectPlayerFrom: (aGame positionOf: player) on: aGame ]
]
