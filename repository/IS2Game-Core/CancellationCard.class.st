Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#category : #'IS2Game-Core-Board'
}

{ #category : #affecting }
CancellationCard >> affect: anEffectTarget on: aGame [

	anEffectTarget apply: RemoveActivePermanentCard new to: aGame
]

{ #category : #'game - double dispatch' }
CancellationCard >> bePlayedOn: aGame by: aPlayer over: anEffectTarget [

	aGame playInstant: self by: aPlayer over: anEffectTarget
]
