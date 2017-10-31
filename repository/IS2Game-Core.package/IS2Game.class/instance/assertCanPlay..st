private
assertCanPlay: aPlayer

	AssertionCheckerBuilder new
		checking: [ :asserter | 
			asserter
				refuse: [ self hasEnded ]
					because:
					('<1s> can not play now, the game has ended' expandMacrosWith: aPlayer);
				enforce: [ aPlayer = self currentPlayer ]
					because:
					('<1s> can not play now, it''s <2s>''s turn'
						expandMacrosWith: aPlayer
						with: playerTurn current) ];
		buildAndCheck