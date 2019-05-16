Class {
	#name : #AffectCurrentPlayer,
	#superclass : #EffectTarget,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #visitor }
AffectCurrentPlayer >> accept: aVisitor [

	^ aVisitor acceptAffectCurrentPlayer: self
]

{ #category : #testing }
AffectCurrentPlayer >> appliesTo: aPlayer on: aGame [

	^ aPlayer = aGame currentPlayer
]

{ #category : #affecting }
AffectCurrentPlayer >> apply: anEffect to: aGame [

	anEffect affect: aGame currentPlayer on: aGame
]
