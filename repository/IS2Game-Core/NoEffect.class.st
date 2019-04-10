Class {
	#name : #NoEffect,
	#superclass : #EffectAction,
	#category : 'IS2Game-Core-Effect'
}

{ #category : #accessing }
NoEffect >> affectPlayerFrom: aPlayerPosition on: aGame [

	
]

{ #category : #accessing }
NoEffect >> printOn: aStream [

	aStream nextPutAll: 'No effect'
]
