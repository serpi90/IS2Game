tests
testUndoTurn

	" The resulting tile is substracted 2 because:
	- 1 for the position at the beginning of this turn (before throwing the dice, the player was at 9th tile)
	- 1 tile for the move made in this turn (after throwing the dice the player moved to the 10th tile, the one with the undo effect
	So, the 8th tile is the position at the start of the previous turn.
	* Undoing 0 turns would leave the player where it was before throwing the dice.
	* Undoing 1 turn would leave the player at the 8th tile (where it was on the previous turn).
	* Undoing 2 turn would leave the player at the 7th tile (where it was 2 turns ago).	"

	| turnsToGoBack |

	turnsToGoBack := 5.
	playerHistory := ((1 to: 10) collect: [ :n | PlayerPosition of: player onLap: 0 tileNumber: n ]) asOrderedCollection.
	self assert: (self positionOf: player) equals: playerHistory last.
	(UndoTurn goingBack: turnsToGoBack) affectTurnOf: player on: self.
	self assert: player isOnLap: 0 tileNumber: 10 - turnsToGoBack - 2