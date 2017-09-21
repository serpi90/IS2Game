accessing
affectPlayersWhenMovingFrom: aPlayerPosition on: aGame

	aGame players do: [ :player | aGame move: player to: (PlayerPosition startingOf: player) ]