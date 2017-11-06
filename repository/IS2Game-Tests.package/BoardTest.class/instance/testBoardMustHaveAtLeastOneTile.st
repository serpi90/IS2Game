tests-accessing
testBoardMustHaveAtLeastOneTile

	self
		shouldnt: [ Board withTiles: {Tile withoutEffect} ]
		raise: InstanceCreationFailed.
	self
		should: [ Board withTiles: #() ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'A Board has at least one tile' ]