affecting
applyOver: aGame inTurnOf: aPlayer

	^ (target appliesTo: aPlayer on: aGame)
		ifTrue: [ action affectGame: aGame ]
		ifFalse: [ aGame ]