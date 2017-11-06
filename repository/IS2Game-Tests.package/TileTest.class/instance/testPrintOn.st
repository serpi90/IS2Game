tests-accessing
testPrintOn

	| effect |

	effect := Effect speedUp.
	self
		assert: (Tile withEffect: effect) printString
		equals: ('Tile <1p>' expandMacrosWith: effect)