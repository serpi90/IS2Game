playing
playCard: aCard for: aPlayer over: aTargetPlayer

	permanentEffects add: (aCard effectAffecting: (AffectSpecificPlayer targeting: aTargetPlayer))