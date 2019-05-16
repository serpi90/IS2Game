Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : 'IS2Game-Tests'
}

{ #category : #tests }
DiceTest >> d4 [

	^ Die withSides: 4 source: ( SequentialGenerator generating: #(1 3 6 8) )
]

{ #category : #tests }
DiceTest >> d6 [

	^ Die withSides: 6 source: ( SequentialGenerator generating: #(1 3 6 8) )
]

{ #category : #tests }
DiceTest >> testDiceMustHaveAtLeastTwoSides [

	-1 to: 1 do: [ :invalidSides | 
		self
			should: [ Die withSides: invalidSides ]
			raise: InstanceCreationFailed
			withMessageText: 'A dice must at least have 2 sides'
		]
]

{ #category : #tests }
DiceTest >> testDiceSet [

	| dice generator1 generator2 |

	generator1 := SequentialGenerator generating: #(1 3 6 2).
	generator2 := SequentialGenerator generating: #(1 3 2 4).
	dice := Dice
		withAll:
			{( Die withSides: 6 source: generator1 ).
			( Die withSides: 4 source: generator2 )}.
	self assert: dice roll equals: 2.	"1 + 1"
	self assert: dice roll equals: 6.	"3 + 3"
	self assert: dice roll equals: 8.	"6 + 2"
	self assert: dice roll equals: 6	"2 + 4"
]

{ #category : #tests }
DiceTest >> testDiceWithFixedGenerator [

	| dice |

	dice := Die withSides: 6 source: ( SequentialGenerator generating: #(1 3 6 8) ).
	self assert: dice roll equals: 1.
	self assert: dice roll equals: 3.
	self assert: dice roll equals: 6.
	self assert: dice roll equals: 2
]

{ #category : #tests }
DiceTest >> testPrintOn [

	| diceSet |

	self assert: self d6 printString equals: '1d6'.
	self assert: self d4 printString equals: '1d4'.
	diceSet := Dice
		withAll:
			{self d6.
			self d4.
			self d6}.
	self assert: diceSet printString equals: '2d6 1d4'
]

{ #category : #tests }
DiceTest >> testPrintOnIsDeterministic [

	self
		assert: ( Dice withAll: ( Array with: self d4 with: self d6 with: self d6 ) ) printString
			equals: '2d6 1d4';
		assert: ( Dice withAll: ( Array with: self d6 with: self d4 with: self d6 ) ) printString
			equals: '2d6 1d4';
		assert: ( Dice withAll: ( Array with: self d6 with: self d6 with: self d4 ) ) printString
			equals: '2d6 1d4';
		assert: ( Dice withAll: ( Array with: self d4 with: self d4 with: self d6 ) ) printString
			equals: '1d6 2d4'
]

{ #category : #tests }
DiceTest >> testRoll [

	| dice |

	dice := Die withSides: 6 source: Random new.
	1 to: 10 do: [ :n | self assert: ( dice roll between: 1 and: 6 ) ].

	dice := Die withSides: 6.
	1 to: 10 do: [ :n | self assert: ( dice roll between: 1 and: 6 ) ]
]

{ #category : #'tests-accessing' }
DiceTest >> testSides [

	| dice |

	dice := Die withSides: 6 source: Random new.
	self assert: dice sides equals: 6
]
