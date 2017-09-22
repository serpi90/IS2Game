accessing
affectPlayersWhenMovingFrom: aPlayerPosition on: aGame

	aGame players do: [ :player | effect affectPlayersWhenMovingFrom: (aGame positionOf: player) on: aGame ]