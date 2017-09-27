tests-building
testProbabilitiesMustAddUpto100Percent

	self
		should: [ Board
				ofSize: 5
				withTilesDefinedBy:
					{(EffectProbablity forEffect: Effect none probability: 10 percent).
					(EffectProbablity forEffect: Effect speedUp probability: 20 percent)}
				source: Random new ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Effect probabilities must add to 100% they add to 30%' ].
	self
		should: [ Board ofSize: 5 withTilesDefinedBy: {(EffectProbablity forEffect: Effect none probability: 130 percent)} source: Random new ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Effect probabilities must add to 100% they add to 130%' ]