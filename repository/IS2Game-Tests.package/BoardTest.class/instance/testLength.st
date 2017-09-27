tests-accessing
testLength

	self
		assert:
			(Board
				withTiles:
					{(Tile numbered: 1).
					(Tile numbered: 2)}) length
		equals: 2