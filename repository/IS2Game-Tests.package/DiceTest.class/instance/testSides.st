tests-accessing
testSides

	| dice |

	dice := Dice withSides: 6 source: Random new.
	self assert: dice sides equals: 6