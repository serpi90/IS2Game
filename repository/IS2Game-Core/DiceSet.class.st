Class {
	#name : #DiceSet,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : 'IS2Game-Core-Board'
}

{ #category : #'instance creation' }
DiceSet class >> withAll: aCollectionOfDice [

	^ self new initializeWithAll: aCollectionOfDice
]

{ #category : #initialization }
DiceSet >> initializeWithAll: aCollectionOfDice [

	dice := aCollectionOfDice
]

{ #category : #rolling }
DiceSet >> printOn: aStream [

	(dice groupedBy: [ :die | die sides ]) associations
		do: [ :sidesToDice | 
			aStream
				print: sidesToDice value size;
				nextPut: $d;
				print: sidesToDice key ]
		separatedBy: [ aStream space ]
]

{ #category : #rolling }
DiceSet >> roll [

	^ dice sumNumbers: [ :die | die roll ]
]
