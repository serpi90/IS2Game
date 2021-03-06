Class {
	#name : #AffectCurrentPlayer,
	#superclass : #EffectTarget,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #testing }
AffectCurrentPlayer >> appliesTo: aPlayer on: aGame [

	^ aPlayer = aGame currentPlayer
]

{ #category : #affecting }
AffectCurrentPlayer >> apply: anEffect to: aGame [

	anEffect affect: aGame currentPlayer on: aGame
]
