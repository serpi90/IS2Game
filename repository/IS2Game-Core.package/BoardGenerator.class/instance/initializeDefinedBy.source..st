initialization
initializeDefinedBy: theEffectProbabilities source: aNumberProvider

	source := aNumberProvider.
	effectProbabilities := Dictionary new.
	theEffectProbabilities
		inject: 0 percent
		into: [ :accumulatedProbability :effectProbability | 
			effectProbabilities at: accumulatedProbability + effectProbability probability put: effectProbability effect.
			accumulatedProbability + effectProbability probability ].
	accumulatedEffectProbabilities := effectProbabilities keys asSortedCollection