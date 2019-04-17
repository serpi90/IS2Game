Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'tiles'
	],
	#category : 'IS2Game-Core-Board'
}

{ #category : #preconditions }
Board class >> assertAddTo100Percent: tileProbabilities [

	| totalProbability |

	totalProbability := Percentage
		ratio: ( tileProbabilities sumNumbers: [ :definition | definition key ] ).
	AssertionChecker
		enforce: [ totalProbability = 100 percent ]
		because:
			( 'Effect probabilities must add to <1p> they add to <2p>'
				expandMacrosWith: 100 percent
				with: totalProbability )
		raising: InstanceCreationFailed
]

{ #category : #private }
Board class >> effectFrom: accumulatedProbabilityTable given: observedValue [

	| bucket |

	bucket := accumulatedProbabilityTable keys
		detect: [ :accumulatedProbability | accumulatedProbability > observedValue ].
	^ ( accumulatedProbabilityTable at: bucket ) value
]

{ #category : #'instance creation' }
Board class >> ofSize: aBoardSize withTilesDefinedBy: theEffectProbabilities source: aNumberProvider [

	| accumulatedProbabilityTable |

	self assertAddTo100Percent: theEffectProbabilities.
	accumulatedProbabilityTable := self probabilityTableFrom: theEffectProbabilities.

	^ self
		withTiles:
			( ( 1 to: aBoardSize )
				collect:
					[ :n | Tile withEffect: ( self effectFrom: accumulatedProbabilityTable given: aNumberProvider next ) ] )
]

{ #category : #private }
Board class >> probabilityTableFrom: effectProbabilities [

	| probabilityTable |

	probabilityTable := OrderedDictionary new.
	effectProbabilities
		inject: 0 percent
		into: [ :accumulatedProbability :effectProbability | 
			probabilityTable at: accumulatedProbability + effectProbability key put: effectProbability value.
			accumulatedProbability + effectProbability key
			].
	^ probabilityTable
]

{ #category : #'instance creation' }
Board class >> withTiles: aTileCollection [

	AssertionChecker
		enforce: [ aTileCollection notEmpty ]
		because: 'A Board has at least one tile'
		raising: InstanceCreationFailed.
	^ self new initializeWithTiles: aTileCollection
]

{ #category : #initialization }
Board >> initializeWithTiles: aTileCollection [

	tiles := aTileCollection
]

{ #category : #accessing }
Board >> length [

	^ tiles size
]

{ #category : #accessing }
Board >> tileNumbered: aTileNumber [

	^ tiles at: aTileNumber
]

{ #category : #accessing }
Board >> tiles [

	^ tiles
]
