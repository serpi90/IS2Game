playing
assertTurnOf: aPlayer

	AssertionChecker enforce: [ aPlayer = playerTurn current ] because: ('It''s the turn of <1p>' expandMacrosWith: aPlayer)