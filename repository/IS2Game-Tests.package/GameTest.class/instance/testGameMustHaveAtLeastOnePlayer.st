tests
testGameMustHaveAtLeastOnePlayer

	self
		should: [ IS2Game
				withBoard: (Board withTiles: (self emptyTiles: 3))
				laps: 1
				dice: (Dice withSides: 6)
				for: #() ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'A game must at least have one player' ]