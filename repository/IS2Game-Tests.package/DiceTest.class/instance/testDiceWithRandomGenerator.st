tests
testDiceWithRandomGenerator

	| dice |
	dice := Dice withSides: 6 source: Random new.
	self assert: (dice roll between: 1 and: 6)