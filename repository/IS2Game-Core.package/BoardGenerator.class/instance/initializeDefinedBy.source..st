initialization
initializeDefinedBy: aDefinitionCollection source: aNumberProvider

	source := aNumberProvider.
	tileProbabilities := Dictionary new.
	aDefinitionCollection
		inject: 0 percent
		into: [ :accumulatedChance :definition | 
			| lowerBound upperBound probabilityRange |

			lowerBound := accumulatedChance.
			upperBound := accumulatedChance + definition chance.
			probabilityRange := lowerBound -> upperBound.
			tileProbabilities at: probabilityRange put: definition tile.
			upperBound ]