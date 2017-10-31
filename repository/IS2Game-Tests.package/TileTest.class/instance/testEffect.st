tests-accessing
testEffect

	| effect mockPosition tileWithEffect tileWithoutEffect |

	effect := Effect speedUp.
	mockPosition := PlayerPosition startingOf: self.
	tileWithEffect := Tile numbered: 1 withEffect: effect.
	tileWithoutEffect := Tile numbered: 1.

	self assert: tileWithEffect effect equals: effect.

	moved := false.
	tileWithEffect effect affectTurnOf: self.
	self assert: moved.

	moved := false.
	tileWithoutEffect effect affectTurnOf: self.
	self deny: moved