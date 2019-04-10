Class {
	#name : #AffectPlayer,
	#superclass : #EffectTarget,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #affecting }
AffectPlayer >> apply: anEffect to: aGame becausePlayerLandedOn: aPlayerPosition [

	anEffect affectPlayerFrom: aPlayerPosition on: aGame
]
