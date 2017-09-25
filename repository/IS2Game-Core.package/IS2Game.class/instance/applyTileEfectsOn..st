private
applyTileEfectsOn: aPlayerPosition

	(board tileFor: aPlayerPosition)
		affect: self
		becausePlayerLandedOn: aPlayerPosition