accessing
affectPlayerFrom: aPlayerPosition on: aGame

	aGame move: aPlayerPosition player to: (PlayerPosition of: aPlayerPosition player onLap: lap tileNumber: tileNumber)