instance creation
withBoard: aBoard laps: aNumberOfLaps dice: aDice for: somePlayers

	AssertionCheckerBuilder new
		raising: InstanceCreationFailed;
		checking: [ :asserter | 
			asserter
				enforce: [ aNumberOfLaps > 0 ] because: 'A game must at least have one lap';
				enforce: [ somePlayers notEmpty ] because: 'A game must at least have one player' ];
		buildAndCheck.
	^ self new
		initializeWithBoard: aBoard
		laps: aNumberOfLaps
		dice: aDice
		for: somePlayers