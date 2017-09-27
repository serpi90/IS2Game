private
probabilityTableFrom: effectProbabilities

	| probabilityTable |

	probabilityTable := Dictionary new.
	effectProbabilities
		inject: 0 percent
		into: [ :accumulatedProbability :effectProbability | 
			probabilityTable at: accumulatedProbability + effectProbability probability put: effectProbability effect.
			accumulatedProbability + effectProbability probability ].
	^ probabilityTable