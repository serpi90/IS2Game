Class {
	#name : #RemoveActivePermanentCard,
	#superclass : #EffectAction,
	#category : #'IS2Game-Core-Effects'
}

{ #category : #affecting }
RemoveActivePermanentCard >> affect: aPermanentCard on: aGame [

	aGame removeActivePermanentCard: aPermanentCard
]
