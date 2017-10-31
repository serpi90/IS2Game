affecting
apply: anEffect to: aGame

	aGame players do: [ :player | anEffect affectTurnOf: player on: aGame ]