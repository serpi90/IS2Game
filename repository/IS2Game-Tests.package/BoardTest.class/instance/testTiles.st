tests-accessing
testTiles

	| board tiles |

	tiles := {(Tile numbered: 1).
	(Tile numbered: 2)}.

	board := Board withTiles: tiles.

	self assertCollection: board tiles equals: tiles