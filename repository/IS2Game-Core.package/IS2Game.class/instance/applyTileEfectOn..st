private
applyTileEfectOn: aPlayerPosition

	(board tileNumbered: aPlayerPosition tileNumber) effect
		affectTurnOf: aPlayerPosition player
		in: self
		considering: permanentEffects