tests
testPrinting

	| dice4 dice6 diceSet |
	dice6 := Dice sides: 6 source: (SequentialGenerator generating: #(1 3 6 8)).
	self assert: dice6 printString equals: '1d6'.
	dice4 := Dice sides: 4 source: (SequentialGenerator generating: #(1 3 6 8)).
	self assert: dice4 printString equals: '1d4'.
	diceSet := DiceSet
		withAll:
			{dice6.
			dice4.
			(Dice sides: 6 source: (SequentialGenerator generating: #(1 3 6 8)))}.
	self assert: diceSet printString equals: '1d4 2d6'