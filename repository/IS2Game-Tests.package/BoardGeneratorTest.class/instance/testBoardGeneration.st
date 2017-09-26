tests-accessing
testBoardGeneration

	| board generator |

	generator := BoardGenerator
		definedBy:
			{(EffectProbablity forEffect: atomicBomb probability: 2 percent).
			(EffectProbablity forEffect: empty probability: 40 percent).
			(EffectProbablity forEffect: wormhole probability: 15 percent).
			(EffectProbablity forEffect: speedUp probability: 15 percent).
			(EffectProbablity forEffect: moonwalk probability: 5 percent).
			(EffectProbablity forEffect: timeMachine probability: 23 percent)}
		source: (SequentialGenerator generating: (0 to: 99)).
	board := generator createBoardOfSize: 200.

	self assert: (board tiles count: [ :tile | tile effect = atomicBomb ]) / board length equals: 2 percent.
	self assert: (board tiles count: [ :tile | tile effect = empty ]) / board length equals: 40 percent.
	self assert: (board tiles count: [ :tile | tile effect = wormhole ]) / board length equals: 15 percent.
	self assert: (board tiles count: [ :tile | tile effect = speedUp ]) / board length equals: 15 percent.
	self assert: (board tiles count: [ :tile | tile effect = moonwalk ]) / board length equals: 5 percent.
	self assert: (board tiles count: [ :tile | tile effect = timeMachine ]) / board length equals: 23 percent