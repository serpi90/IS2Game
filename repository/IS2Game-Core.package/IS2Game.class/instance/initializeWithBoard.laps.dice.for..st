initialization
initializeWithBoard: aBoard laps: aNumberOfLaps dice: aDice for: somePlayers

	board := aBoard.
	laps := aNumberOfLaps.
	dice := aDice.
	players := somePlayers.
	playerTurn := CircularIterator cyclingOver: somePlayers.
	status := PlayerTurn currentOf: playerTurn current.
	playerPositions := (players collect: [ :player | PlayerPosition startingOf: player ]) asOrderedCollection.
	permanentEffects := OrderedCollection new