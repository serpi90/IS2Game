assertions
assert: aPlayer isOnLap: aLap tileNumber: aTileNumber

	| position |

	position := self positionOf: aPlayer.
	self assert: position player equals: aPlayer.
	self assert: position tileNumber equals: aTileNumber.
	self assert: position lap equals: aLap