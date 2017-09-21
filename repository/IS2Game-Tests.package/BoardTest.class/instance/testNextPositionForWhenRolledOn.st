tests-accessing
testNextPositionForWhenRolledOn

	| tiles board position bob game |

	tiles := Array with: EmptyTile new with: EmptyTile new with: EmptyTile new.
	board := Board withTiles: tiles.
	bob := 'Bob'.
	game := self gameFor: bob on: board.

	position := PlayerPosition of: bob onLap: 0 tileNumber: 0.
	self assert: (board nextPositionFor: position whenRolled: 1 on: game) tileNumber equals: position tileNumber + 1.
	self assert: (board nextPositionFor: position whenRolled: 1 on: game) lap equals: position lap.

	self assert: (board nextPositionFor: position whenRolled: board length + 2 on: game) tileNumber equals: position tileNumber + 2.
	self assert: (board nextPositionFor: position whenRolled: board length + 1 on: game) lap equals: position lap + 1