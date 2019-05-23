Class {
	#name : #RemoveActivePermanentCard,
	#superclass : #EffectAction,
	#category : #'IS2Game-Core-Effect'
}

{ #category : #affecting }
RemoveActivePermanentCard >> affect: aPermanentCard on: aGame [

	aGame removeActivePermanentCard: aPermanentCard
]
