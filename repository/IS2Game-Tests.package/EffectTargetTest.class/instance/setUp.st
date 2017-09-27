initialization
setUp

	moveOneTile := MovePlayer movingForward: 1.
	player1 := 'Player 1'.
	player2 := 'Player 2'.
	player3 := 'Player 3'.
	playerPositions := ({player1.
	player2.
	player3} collect: [ :player | player -> (PlayerPosition startingOf: player) ]) asDictionary