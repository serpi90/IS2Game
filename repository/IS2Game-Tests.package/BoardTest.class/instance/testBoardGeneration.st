tests-accessing
testBoardGeneration

	| board generator |

	generator := BoardGenerator
		definedBy: self tileDefinitions
		source: (SequentialGenerator generating: (0 to: 99)).
	board := generator createBoardOfSize: 200.

	1 to: 2 do: [ :i | 
		self assert: (board tileAt: i) equals: atomicBomb.
		self assert: (board tileAt: i + 100) equals: atomicBomb ].
	3 to: 42 do: [ :i | 
		self assert: (board tileAt: i) equals: empty.
		self assert: (board tileAt: i + 100) equals: empty ].
	43 to: 57 do: [ :i | 
		self assert: (board tileAt: i) equals: wormhole.
		self assert: (board tileAt: i + 100) equals: wormhole ].
	58 to: 72 do: [ :i | 
		self assert: (board tileAt: i) equals: speedUp.
		self assert: (board tileAt: i + 100) equals: speedUp ].
	73 to: 77 do: [ :i | 
		self assert: (board tileAt: i) equals: moonwalk.
		self assert: (board tileAt: i + 100) equals: moonwalk ].
	78 to: 100 do: [ :i | 
		self assert: (board tileAt: i) equals: timeMachine.
		self assert: (board tileAt: i + 100) equals: timeMachine ]