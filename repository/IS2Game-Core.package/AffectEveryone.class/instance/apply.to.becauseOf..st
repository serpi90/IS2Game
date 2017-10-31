affecting
apply: anEffect to: aGame becauseOf: aPlayer

	aGame players do: [ :player | anEffect affectTurnOf: player on: aGame ]