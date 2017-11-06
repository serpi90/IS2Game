private
adjustedRollFor: aPlayer whenRolled: aDiceRoll

	^ (self permanentEffectsFor: aPlayer)
		inject: aDiceRoll
		into:
			[ :affectedRoll :effect | effect affectRoll: affectedRoll of: aPlayer on: self ]