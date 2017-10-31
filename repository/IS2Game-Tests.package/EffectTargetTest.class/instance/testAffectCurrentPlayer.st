tests
testAffectCurrentPlayer

	| target |

	target := AffectCurrentPlayer new.
	self assert: (target appliesTo: currentPlayer on: self).
	self deny: (target appliesTo: anotherPlayer on: self).
	self deny: (target appliesTo: yetAnotherPlayer on: self).

	self assert: currentPlayer isOnLap: 0 tileNumber: 1.
	self assert: anotherPlayer isOnLap: 0 tileNumber: 1.
	self assert: yetAnotherPlayer isOnLap: 0 tileNumber: 1.
	target apply: moveOneTile to: self.
	self assert: currentPlayer isOnLap: 0 tileNumber: 2.
	self assert: anotherPlayer isOnLap: 0 tileNumber: 1.
	self assert: yetAnotherPlayer isOnLap: 0 tileNumber: 1