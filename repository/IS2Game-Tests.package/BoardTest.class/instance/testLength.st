tests-accessing
testLength

	self assert: (Board withTiles: (Array with: EmptyTile new with: EmptyTile new)) length equals: 2