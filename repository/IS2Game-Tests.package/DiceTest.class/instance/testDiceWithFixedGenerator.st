tests
testDiceWithFixedGenerator

	| dice |
	dice := Dice withSides: 6 source: (SequentialGenerator generating: #(1 3 6 8)).
	self assert: dice roll equals: 1.
	self assert: dice roll equals: 3.
	self assert: dice roll equals: 6.
	self assert: dice roll equals: 2