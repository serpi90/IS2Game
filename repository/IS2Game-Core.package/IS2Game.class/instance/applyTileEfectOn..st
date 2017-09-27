private
applyTileEfectOn: aPlayerPosition

	(board tileNumbered: aPlayerPosition tileNumber) effect
		affect: self
		becausePlayerLandedOn: aPlayerPosition