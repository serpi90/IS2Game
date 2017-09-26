tests-building
testProbabilitiesMustAddUpto100Percent

	self
		should: [ BoardGenerator definedBy: #() source: Random new ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Can not generate board without effect probabilities' ].
	self
		should: [ BoardGenerator definedBy: {(EffectProbablity forEffect: Effect none probability: 30 percent)} source: Random new ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Effect probabilities must add to 100% they add to 30%' ].
	self
		should: [ BoardGenerator definedBy: {(EffectProbablity forEffect: Effect none probability: 130 percent)} source: Random new ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Effect probabilities must add to 100% they add to 130%' ]