private
applyTileEfectOn: aPlayerPosition

	(board tileAt: aPlayerPosition tileNumber) effect
		affect: self
		becausePlayerLandedOn: aPlayerPosition