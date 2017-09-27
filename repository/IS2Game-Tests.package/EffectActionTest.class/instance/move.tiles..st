mocking
move: aPlayer tiles: aNumberOfTiles

	| position |

	position := self positionOf: aPlayer.
	self move: aPlayer to: (PlayerPosition of: aPlayer onLap: position lap tileNumber: position tileNumber + aNumberOfTiles)