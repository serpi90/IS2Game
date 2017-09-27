private
effectFrom: accumulatedProbabilityTable given: observedValue

	| accumulatedProbabilities |

	accumulatedProbabilities := accumulatedProbabilityTable keys sorted.
	^ accumulatedProbabilityTable at: (accumulatedProbabilities detect: [ :accumulatedProbability | accumulatedProbability > observedValue ])