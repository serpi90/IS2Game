tests
testResetTurn

	" The resulting tile is substracted 2 because:
	- 1 for the position at the beginning of this turn (before throwing the dice, the player was at 9th tile)
	- 1 tile for the move made in this turn (after throwing the dice the player moved to the 10th tile, the one with the undo effect
	So, the 8th tile is the position at the start of the previous turn.
	* Undoing 0 turns would leave the player where it was before throwing the dice."

	playerHistory := ((1 to: 10) collect: [ :n | PlayerPosition of: player onLap: 0 tileNumber: n ])
		asOrderedCollection.
	self assert: (self positionOf: player) equals: playerHistory last.
	UndoTurn resetTurn affectTurnOf: player on: self.
	self assert: player isOnLap: 0 tileNumber: 10 - 2