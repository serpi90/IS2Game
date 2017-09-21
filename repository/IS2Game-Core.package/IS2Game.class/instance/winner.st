accessing
winner

	AssertionChecker enforce: [ self hasEnded ] because: 'Can not define a winner until game has ended'.
	^ playerPositions last player