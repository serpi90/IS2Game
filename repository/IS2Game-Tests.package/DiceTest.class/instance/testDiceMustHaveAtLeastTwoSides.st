tests
testDiceMustHaveAtLeastTwoSides

	-1 to: 1 do: [ :invalidSides | self should: [ Dice withSides: invalidSides ] raise: InstanceCreationFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'A dice must at least have 2 sides' ] ]