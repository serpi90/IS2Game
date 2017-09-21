tests
testDiceSet

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