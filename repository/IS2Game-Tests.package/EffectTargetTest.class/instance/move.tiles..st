asserting
move: aPlayer tiles: aNumberOfTiles

	| position |

	position := playerPositions at: aPlayer.
	playerPositions at: aPlayer put: (PlayerPosition of: position player onLap: position lap tileNumber: position tileNumber + aNumberOfTiles)