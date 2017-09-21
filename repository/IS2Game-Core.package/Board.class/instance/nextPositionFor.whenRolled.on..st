accessing
nextPositionFor: aPlayerPosition whenRolled: aRoll on: aGame

	| landingTile |

	landingTile := tiles at: (self tileNumberWhenMoving: aRoll from: aPlayerPosition) + 1.
	^ landingTile positionWhenMoving: aRoll from: aPlayerPosition on: self