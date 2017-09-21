printing
printOn: aStream

	aStream
		nextPutAll: ('<1s> Tile: <2p> Lap: <3p>' expandMacrosWith: player with: tileNumber with: lap)