initialization
setUp

	moveOneTile := MovePlayer movingForward: 1.
	currentPlayer := 'Player 1'.
	anotherPlayer := 'Player 2'.
	yetAnotherPlayer := 'Player 3'.
	playerPositions := ({currentPlayer.
	anotherPlayer.
	yetAnotherPlayer} collect: [ :player | player -> (PlayerPosition startingOf: player) ]) asDictionary