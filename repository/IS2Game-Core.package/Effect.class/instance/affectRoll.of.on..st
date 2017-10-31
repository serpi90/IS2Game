affecting
affectRoll: aDiceRoll of: aPlayer on: aGame

	^ (target appliesTo: aPlayer on: aGame)
		ifTrue: [ action affectRoll: aDiceRoll ]
		ifFalse: [ aDiceRoll ]