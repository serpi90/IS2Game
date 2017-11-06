tests-accessing
testEffect

	| effect mockPosition tileWithEffect tileWithoutEffect |

	effect := Effect speedUp.
	mockPosition := PlayerPosition startingOf: self.
	tileWithEffect := Tile withEffect: effect.
	tileWithoutEffect := Tile withoutEffect.

	self assert: tileWithEffect effect equals: effect.

	moved := false.
	tileWithEffect effect affectTurnOf: mockPosition player in: self considering: #().
	self assert: moved.

	moved := false.
	tileWithoutEffect effect affectTurnOf: mockPosition player in: self considering: #().
	self deny: moved