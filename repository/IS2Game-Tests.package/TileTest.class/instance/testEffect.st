tests-accessing
testEffect

	| effect mockPosition tileWithEffect tileWithoutEffect |

	effect := Effect speedUp.
	mockPosition := PlayerPosition startingOf: self.
	tileWithEffect := Tile numbered: 1 withEffect: effect.
	tileWithoutEffect := Tile numbered: 1.

	self assert: tileWithEffect effect equals: effect.

	moved := false.
	tileWithEffect effect affect: self becausePlayerLandedOn: mockPosition.
	self assert: moved.

	moved := false.
	tileWithoutEffect effect affect: self becausePlayerLandedOn: mockPosition.
	self deny: moved