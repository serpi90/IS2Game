Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'IS2Game-Core-Board'
}

{ #category : #'instance creation' }
Dice class >> withAll: aCollectionOfDie [

	^ self new initializeWithAll: aCollectionOfDie
]

{ #category : #initialization }
Dice >> initializeWithAll: aCollectionOfDie [

	dice := aCollectionOfDie
]

{ #category : #printing }
Dice >> printOn: aStream [

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
Dice >> roll [

	^ dice sumNumbers: #roll
]
