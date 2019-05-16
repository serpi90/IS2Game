Class {
	#name : #AffectEveryoneElse,
	#superclass : #EffectTarget,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #visitor }
AffectEveryoneElse >> accept: aVisitor [

	^ aVisitor acceptAffectEveryoneElse: self
]

{ #category : #testing }
AffectEveryoneElse >> appliesTo: aPlayer on: aGame [

	^ aPlayer ~= aGame currentPlayer
]

{ #category : #affecting }
AffectEveryoneElse >> apply: anEffect to: aGame [

	( aGame players copyWithout: aGame currentPlayer )
		do: [ :player | anEffect affect: player on: aGame ]
]
