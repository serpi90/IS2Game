initialization
initializeWithBoard: aBoard laps: aNumberOfLaps dice: aDice for: somePlayers

	board := aBoard.
	laps := aNumberOfLaps.
	dice := aDice.
	players := somePlayers.
	playerTurn := CircularIterator cyclingOver: somePlayers.
	playerPositions := (players
		collect: [ :player | PlayerPosition startingOf: player ])
		asOrderedCollection