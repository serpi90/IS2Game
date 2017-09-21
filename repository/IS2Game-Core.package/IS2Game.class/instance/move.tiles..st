playing
move: aPlayer tiles: numberOfTilesToMove

	| newPosition |

	newPosition := self positionFor: (self positionOf: aPlayer) whenMoving: numberOfTilesToMove.

	self move: aPlayer to: newPosition