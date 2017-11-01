private
permanentEffectsFor: aPlayer

	^ permanentEffects select: [ :effect | effect appliesTo: aPlayer on: self ]