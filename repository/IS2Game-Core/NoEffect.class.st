Class {
	#name : #NoEffect,
	#superclass : #EffectAction,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #affecting }
NoEffect >> affect: aPlayer on: aGame [

	
]

{ #category : #printing }
NoEffect >> printOn: aStream [

	aStream nextPutAll: 'No effect'
]
