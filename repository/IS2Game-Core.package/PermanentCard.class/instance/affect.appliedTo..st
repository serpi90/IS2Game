affecting
affect: aGame appliedTo: aPlayer

	aGame addPermanentEffect: (Effect named: name affecting: (AffectSpecificPlayer targeting: aPlayer) doing: action) to: aPlayer