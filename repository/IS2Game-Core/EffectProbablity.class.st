Class {
	#name : #EffectProbablity,
	#superclass : #Object,
	#instVars : [
		'effect',
		'probability'
	],
	#category : 'IS2Game-Core-Effect'
}

{ #category : #'instance creation' }
EffectProbablity class >> forEffect: anEffect probability: aPercentage [

	^ self new initializeForEffect: anEffect probability: aPercentage
]

{ #category : #accessing }
EffectProbablity >> effect [

	^ effect
]

{ #category : #initialization }
EffectProbablity >> initializeForEffect: anEffect probability: aPercentage [

	effect := anEffect.
	probability := aPercentage
]

{ #category : #accessing }
EffectProbablity >> probability [

	^ probability
]
