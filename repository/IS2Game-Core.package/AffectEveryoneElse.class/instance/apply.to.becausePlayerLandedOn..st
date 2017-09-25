affecting
apply: anEffect to: aGame becausePlayerLandedOn: aPlayerPosition

	(aGame players copyWithout: aPlayerPosition player)
		do: [ :player | anEffect affectPlayerFrom: (aGame positionOf: player) on: aGame ]