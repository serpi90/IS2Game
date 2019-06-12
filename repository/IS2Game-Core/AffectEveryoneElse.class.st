Class {
	#name : #AffectEveryoneElse,
	#superclass : #EffectTarget,
	#category : #'IS2Game-Core-Effects'
}

{ #category : #testing }
AffectEveryoneElse >> appliesTo: aPlayer on: aGame [

	^ aPlayer ~= aGame currentPlayer
]

{ #category : #affecting }
AffectEveryoneElse >> apply: anEffect to: aGame [

	( aGame players copyWithout: aGame currentPlayer )
		do: [ :player | anEffect affect: player on: aGame ]
]
