tests-building
testDefinitionsMustAddUpto100Percent

	self
		should: [ BoardGenerator definedBy: #() source: Random new ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Can not generate board without tile definitions' ].
	self
		should: [ BoardGenerator definedBy: {(TileProbablity forTile: Tile empty chance: 30 percent)} source: Random new ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Tile probabilities must add to 100% they add to 30% need 70% more.' ].
	self
		should: [ BoardGenerator
				definedBy:
					{(TileProbablity forTile: Tile empty chance: 30 percent).
					(TileProbablity forTile: Tile empty chance: 25 percent)}
				source: Random new ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Tile probabilities must add to 100% they add to 55% need 45% more.' ]