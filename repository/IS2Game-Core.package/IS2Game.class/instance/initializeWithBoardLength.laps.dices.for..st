initialization
initializeWithBoardLength: aLength laps: aNumberOfLaps dices: aDice for: somePlayers

	boardLength := aLength.
	laps := aNumberOfLaps.
	dice := aDice.
	players := somePlayers.
	playerTurn := CircularIterator cyclingOver: somePlayers.
	playerPositions := (players collect: [ :player | PlayerPosition of: player onLap: 0 tile: 0 ]) asOrderedCollection