building
tileAccordingTo: observedValue

	| effect |

	effect := effectProbabilities at: (accumulatedEffectProbabilities detect: [ :accumulatedProbability | accumulatedProbability > observedValue ]).

	^ Tile withEffect: effect