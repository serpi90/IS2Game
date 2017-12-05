playing
playCard: aCard for: aPlayer over: aTargetPlayer

	self
		playPermanent: aCard
		by: aPlayer
		over: (AffectSpecificPlayer targeting: aTargetPlayer)