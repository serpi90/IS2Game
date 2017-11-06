tests-accessing
testLength

	self
		assert:
			(Board
				withTiles:
					{Tile withoutEffect.
					Tile withoutEffect}) length
		equals: 2