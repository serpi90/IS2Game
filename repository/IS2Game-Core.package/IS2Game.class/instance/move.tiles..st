playing
move: aPlayer tiles: numberOfTilesToMove

	| newPosition |

	newPosition := (self positionOf: aPlayer) positionWhenMoving: numberOfTilesToMove on: board.

	self move: aPlayer to: newPosition