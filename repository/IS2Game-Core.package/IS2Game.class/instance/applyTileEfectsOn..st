private
applyTileEfectsOn: aPlayerPosition

	| landingTile |

	landingTile := board tileFor: aPlayerPosition.
	landingTile affectPlayersWhenMovingFrom: aPlayerPosition on: self