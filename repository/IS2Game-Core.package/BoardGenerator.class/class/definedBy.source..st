instance creation
definedBy: aDefinitionCollection source: aNumberProvider

	AssertionCheckerBuilder new
		raising: InstanceCreationFailed;
		checking: [ :asserter | 
			asserter
				enforce: [ aDefinitionCollection notEmpty ]
				because: 'Can not generate board without tile definitions'
				onSuccess: [ :notEmptyAsserter | 
					| sum expected |

					expected := 100 percent.
					sum := aDefinitionCollection sum: [ :definition | definition chance ].
					notEmptyAsserter enforce: [ sum = expected ] because: ('Tile probabilities must add to <1p> they add to <2p> need <3p> more.' expandMacrosWith: expected with: sum with: expected - sum) ] ];
		buildAndCheck.
	^ self new initializeDefinedBy: aDefinitionCollection source: aNumberProvider