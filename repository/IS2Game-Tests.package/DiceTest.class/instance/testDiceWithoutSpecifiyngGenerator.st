tests
testDiceWithoutSpecifiyngGenerator

	| dice |

	dice := Dice withSides: 6.
	self assert: (dice roll between: 1 and: 6).
	self assert: (dice roll between: 1 and: 6).
	self assert: (dice roll between: 1 and: 6).
	self assert: (dice roll between: 1 and: 6).
	self assert: (dice roll between: 1 and: 6)