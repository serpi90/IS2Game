tests-accessing
testTileNumbered

	| firstTile secondTile board |

	firstTile := Tile numbered: 1.
	secondTile := Tile numbered: 2.
	board := Board withTiles: (Array with: firstTile with: secondTile).

	self assert: (board tileNumbered: 1) equals: firstTile.
	self assert: (board tileNumbered: 2) equals: secondTile.
	self deny: (board tileNumbered: 1) = secondTile.
	self deny: (board tileNumbered: 2) = firstTile