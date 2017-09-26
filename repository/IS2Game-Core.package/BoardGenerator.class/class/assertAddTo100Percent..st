instance creation
assertAddTo100Percent: tileProbabilities

	AssertionCheckerBuilder new
		raising: InstanceCreationFailed;
		checking: [ :asserter | 
			asserter
				enforce: [ tileProbabilities notEmpty ]
				because: 'Can not generate board without effect probabilities'
				onSuccess: [ :notEmptyAsserter | 
					| totalProbability |

					totalProbability := tileProbabilities sum: [ :definition | definition probability ].
					notEmptyAsserter enforce: [ totalProbability = 100 percent ] because: ('Effect probabilities must add to <1p> they add to <2p>' expandMacrosWith: 100 percent with: totalProbability) ] ];
		buildAndCheck