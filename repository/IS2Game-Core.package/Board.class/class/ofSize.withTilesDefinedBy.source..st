instance creation
ofSize: aBoardSize withTilesDefinedBy: theEffectProbabilities source: aNumberProvider

	| accumulatedProbabilityTable |

	self assertAddTo100Percent: theEffectProbabilities.
	accumulatedProbabilityTable := self
		probabilityTableFrom: theEffectProbabilities.

	^ self
		withTiles:
			((1 to: aBoardSize)
				collect: [ :n | 
					Tile
						withEffect:
							(self
								effectFrom: accumulatedProbabilityTable
								given: aNumberProvider next) ])