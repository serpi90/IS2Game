tests-accessing
testPrintOn

	| effect |

	effect := Effect speedUp.
	self assert: (Tile numbered: 1 withEffect: effect) printString equals: ('1 - <1p>' expandMacrosWith: effect)