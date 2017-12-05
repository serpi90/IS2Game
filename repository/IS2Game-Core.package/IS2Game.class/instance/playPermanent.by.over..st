playing
playPermanent: aCard by: aPlayer over: target

	status assertCanPlayPermanentCard: aPlayer.
	permanentEffects add: (aCard effectAffecting: target)