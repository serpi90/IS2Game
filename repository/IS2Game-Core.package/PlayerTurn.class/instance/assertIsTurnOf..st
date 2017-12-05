asserting
assertIsTurnOf: aPlayer

	AssertionChecker enforce: [ aPlayer = self currentPlayer ] because: ('<1s> can not play now, it''s <2s>''s turn' expandMacrosWith: aPlayer with: self currentPlayer)