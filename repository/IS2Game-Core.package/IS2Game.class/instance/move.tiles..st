playing
move: aPlayer tiles: aNumberOfTiles

	| newPosition |

	newPosition := self
		positionFor: (self positionOf: aPlayer)
		whenMoving: aNumberOfTiles.

	self addPosition: newPosition