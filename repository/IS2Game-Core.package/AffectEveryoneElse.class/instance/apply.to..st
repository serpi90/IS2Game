affecting
apply: anEffect to: aGame

	(aGame players copyWithout: aGame currentPlayer) do: [ :player | anEffect affectTurnOf: player on: aGame ]