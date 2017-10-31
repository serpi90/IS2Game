affecting
apply: anEffect to: aGame becauseOf: aPlayer

	(aGame players copyWithout: aPlayer)
		do: [ :player | anEffect affectTurnOf: player on: aGame ]