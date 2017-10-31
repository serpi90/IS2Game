private
permanentEffectsFor: aPlayer

	^ playerEffects at: aPlayer ifAbsentPut: [ Set new ]