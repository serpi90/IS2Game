Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : 'IS2Game-Tests'
}

{ #category : #tests }
DiceTest >> testDiceMustHaveAtLeastTwoSides [

	-1 to: 1 do: [ :invalidSides | self should: [ Dice withSides: invalidSides ] raise: InstanceCreationFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'A dice must at least have 2 sides' ] ]
]

{ #category : #tests }
DiceTest >> testDiceSet [

	| dice generator1 generator2 |
	generator1 := SequentialGenerator generating: #(1 3 6 2).
	generator2 := SequentialGenerator generating: #(1 3 2 4).
	dice := DiceSet
		withAll:
			{(Dice withSides: 6 source: generator1).
			(Dice withSides: 4 source: generator2)}.
	self assert: dice roll equals: 2.	"1 + 1"
	self assert: dice roll equals: 6.	"3 + 3"
	self assert: dice roll equals: 8.	"6 + 2"
	self assert: dice roll equals: 6	"2 + 4"
]

{ #category : #tests }
DiceTest >> testDiceWithFixedGenerator [

	| dice |
	dice := Dice withSides: 6 source: (SequentialGenerator generating: #(1 3 6 8)).
	self assert: dice roll equals: 1.
	self assert: dice roll equals: 3.
	self assert: dice roll equals: 6.
	self assert: dice roll equals: 2
]

{ #category : #tests }
DiceTest >> testPrintOn [

	| dice4 dice6 diceSet |
	dice6 := Dice withSides: 6 source: (SequentialGenerator generating: #(1 3 6 8)).
	self assert: dice6 printString equals: '1d6'.
	dice4 := Dice withSides: 4 source: (SequentialGenerator generating: #(1 3 6 8)).
	self assert: dice4 printString equals: '1d4'.
	diceSet := DiceSet
		withAll:
			{dice6.
			dice4.
			(Dice withSides: 6 source: (SequentialGenerator generating: #(1 3 6 8)))}.
	self assert: diceSet printString equals: '1d4 2d6'
]

{ #category : #tests }
DiceTest >> testRoll [

	| dice |

	dice := Dice withSides: 6 source: Random new.
	1 to: 10 do: [ :n | self assert: (dice roll between: 1 and: 6) ].

	dice := Dice withSides: 6.
	1 to: 10 do: [ :n | self assert: (dice roll between: 1 and: 6) ]
]

{ #category : #'tests-accessing' }
DiceTest >> testSides [

	| dice |

	dice := Dice withSides: 6 source: Random new.
	self assert: dice sides equals: 6
]
