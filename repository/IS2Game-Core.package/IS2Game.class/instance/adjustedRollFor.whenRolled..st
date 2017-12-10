private
adjustedRollFor: aPlayer whenRolled: aDiceRoll

	^ (permanentEffects select: [ :effect | effect appliesTo: aPlayer on: self ]) inject: aDiceRoll into: [ :roll :effect | effect affectRoll: roll of: aPlayer on: self ]