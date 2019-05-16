Class {
	#name : #RemoveActivePermanentCard,
	#superclass : #Object,
	#category : #'IS2Game-Core-Board'
}

{ #category : #affecting }
RemoveActivePermanentCard >> affect: aPermanentCard on: aGame [

	aGame removeActivePermanentCard: aPermanentCard
]
