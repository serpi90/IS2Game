Class {
	#name : #PermanentCard,
	#superclass : #Object,
	#instVars : [
		'name',
		'action'
	],
	#category : 'IS2Game-Core-Board'
}

{ #category : #'well known cards' }
PermanentCard class >> cushioning [

	^ self named: 'Softening' doing: (MultiplyEffect by: 1 / 2)
]

{ #category : #'instance creation' }
PermanentCard class >> named: aName doing: anAction [

	^ self new initializeNamed: aName doing: anAction
]

{ #category : #'well known cards' }
PermanentCard class >> overload [

	^ self named: 'Overload' doing: (ModifyRoll decreaseBy: 2)
]

{ #category : #'well known cards' }
PermanentCard class >> speed [

	^ self named: 'Speed' doing: (ModifyRoll increaseBy: 1)
]

{ #category : #affecting }
PermanentCard >> effectAffecting: aTarget [

	^ Effect named: name affecting: aTarget doing: action
]

{ #category : #initialization }
PermanentCard >> initializeNamed: aName doing: anAction [

	name := aName.
	action := anAction
]
