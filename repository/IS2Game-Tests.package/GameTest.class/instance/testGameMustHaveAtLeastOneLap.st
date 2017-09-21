tests
testGameMustHaveAtLeastOneLap

	self
		should: [ IS2Game
				withBoardOfLength: 3
				laps: 0
				dices: (Dice withSides: 6)
				for: {'bob'} ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'A game must at least have one lap' ]