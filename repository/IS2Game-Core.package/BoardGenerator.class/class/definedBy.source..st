instance creation
definedBy: tileProbabilities source: aNumberProvider

	self assertAddTo100Percent: tileProbabilities.
	^ self new
		initializeDefinedBy: tileProbabilities
		source: aNumberProvider