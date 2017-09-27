tests
testGameMustHaveAtLeastOneLap

	self
		should: [ IS2Game
				withBoard: (Board withTiles: (self emptyTiles: 3))
				laps: 0
				dice: (Dice withSides: 6)
				for: {bob} ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'A game must at least have one lap' ]