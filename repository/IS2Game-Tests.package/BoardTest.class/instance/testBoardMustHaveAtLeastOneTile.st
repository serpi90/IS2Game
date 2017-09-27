tests-accessing
testBoardMustHaveAtLeastOneTile

	self shouldnt: [ Board withTiles: {(Tile numbered: 1)} ] raise: InstanceCreationFailed.
	self should: [ Board withTiles: #() ] raise: InstanceCreationFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'A Board has at least one tile' ]