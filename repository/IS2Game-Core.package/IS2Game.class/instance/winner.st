accessing
winner

	AssertionChecker enforce: [ self hasEnded ] because: 'Cant define winner until game has ended'.
	^ playerPositions last player