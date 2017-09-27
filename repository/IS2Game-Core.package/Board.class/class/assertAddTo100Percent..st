preconditions
assertAddTo100Percent: tileProbabilities

	| totalProbability |

	totalProbability := Percentage ratio: (tileProbabilities sumNumbers: [ :definition | definition probability ]).
	AssertionChecker
		enforce: [ totalProbability = 100 percent ]
		because: ('Effect probabilities must add to <1p> they add to <2p>' expandMacrosWith: 100 percent with: totalProbability)
		raising: InstanceCreationFailed