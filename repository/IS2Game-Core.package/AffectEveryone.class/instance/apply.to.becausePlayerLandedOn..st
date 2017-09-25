affecting
apply: anEffect to: aGame becausePlayerLandedOn: aPlayerPosition

	aGame players do: [ :player | anEffect affectPlayerFrom: (aGame positionOf: player) on: aGame ]