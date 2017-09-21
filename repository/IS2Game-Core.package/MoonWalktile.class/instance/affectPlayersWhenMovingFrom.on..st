accessing
affectPlayersWhenMovingFrom: aPlayerPosition on: aGame

	aGame players do: [ :player | aGame move: player tiles: tilesToGoBack negated ]