tests-accessing
testTiles

	| board tiles |

	tiles := {Tile withoutEffect.
	Tile withoutEffect}.

	board := Board withTiles: tiles.

	self assertCollection: board tiles equals: tiles