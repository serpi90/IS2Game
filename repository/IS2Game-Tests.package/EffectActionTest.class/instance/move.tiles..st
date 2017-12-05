mocking
move: aPlayer tiles: aNumberOfTiles

	| position |

	position := self positionOf: aPlayer.
	self
		addPosition:
			(PlayerPosition
				of: aPlayer
				onLap: position lap
				tileNumber: position tileNumber + aNumberOfTiles)