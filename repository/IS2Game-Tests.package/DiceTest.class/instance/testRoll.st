tests
testRoll

	| dice |

	dice := Dice withSides: 6 source: Random new.
	1 to: 10 do: [ :n | self assert: (dice roll between: 1 and: 6) ].

	dice := Dice withSides: 6.
	1 to: 10 do: [ :n | self assert: (dice roll between: 1 and: 6) ]