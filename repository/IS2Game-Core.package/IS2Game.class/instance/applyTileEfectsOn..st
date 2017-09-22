private
applyTileEfectsOn: aPlayerPosition

	| landingTile |

	landingTile := board tileFor: aPlayerPosition.
	landingTile effect affectPlayersWhenMovingFrom: aPlayerPosition on: self