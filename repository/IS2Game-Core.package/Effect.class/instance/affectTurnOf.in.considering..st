affecting
affectTurnOf: aPlayer in: aGame considering: permanentEffects

	target apply: action to: (permanentEffects inject: aGame into: [ :theGame :permanentEffect | permanentEffect applyOver: theGame inTurnOf: aPlayer ])