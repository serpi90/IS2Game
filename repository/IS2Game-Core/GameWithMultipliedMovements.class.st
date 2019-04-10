Class {
	#name : #GameWithMultipliedMovements,
	#superclass : #Object,
	#instVars : [
		'game',
		'multiplier'
	],
	#category : 'IS2Game-Core-Game'
}

{ #category : #'instance creation' }
GameWithMultipliedMovements class >> on: aGame by: aMultiplier [

	^ self new initializeOn: aGame by: aMultiplier
]

{ #category : #'reflective operations' }
GameWithMultipliedMovements >> doesNotUnderstand: aMessage [

	^ [ aMessage sendTo: game ]
		on: MessageNotUnderstood
		do: [ super doesNotUnderstand: aMessage ]
]

{ #category : #initialization }
GameWithMultipliedMovements >> initializeOn: aGame by: aMultiplier [

	game := aGame.
	multiplier := aMultiplier
]

{ #category : #playing }
GameWithMultipliedMovements >> move: aPlayer tiles: aNumberOfTiles [

	^ game move: aPlayer tiles: (aNumberOfTiles * multiplier) ceiling
]
