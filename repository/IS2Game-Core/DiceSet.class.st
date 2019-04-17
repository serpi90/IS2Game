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

{ #category : #printing }
DiceSet >> printOn: aStream [

	( ( dice groupedBy: #sides ) associations sorted: #key descending )
		do: [ :sidesToDice | 
			aStream
				print: sidesToDice value size;
				nextPut: $d;
				print: sidesToDice key
			]
		separatedBy: [ aStream space ]
]

{ #category : #rolling }
DiceSet >> roll [

	^ dice sumNumbers: #roll
]
