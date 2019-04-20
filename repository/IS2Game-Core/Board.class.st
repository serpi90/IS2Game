Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'tiles'
	],
	#category : 'IS2Game-Core-Board'
}

{ #category : #'instance creation' }
Board class >> accumulatedProbabilityTableFor: theEffectProbabilities [

	| table total |

	table := OrderedDictionary new.
	theEffectProbabilities
		inject: 0 percent
		into: [ :accumulatedProbability :each | 
			| probability effectProvider |

			probability := each key.
			effectProvider := each value.
			table at: accumulatedProbability + probability put: effectProvider.
			accumulatedProbability + probability
			].

	total := table keys last.
	AssertionChecker
		enforce: [ total = 100 percent ]
		because:
			( 'Effect probabilities must add to <1p> they add to <2p>' expandMacrosWith: 100 percent with: total )
		raising: InstanceCreationFailed.
	^ table
]

{ #category : #'instance creation' }
Board class >> ofSize: aBoardSize withTilesDefinedBy: theEffectProbabilities source: aNumberProvider [

	| table tiles |

	table := self accumulatedProbabilityTableFor: theEffectProbabilities.
	tiles := ( 1 to: aBoardSize )
		collect: [ :n | 
			| bucket observedValue effectProvider |

			observedValue := aNumberProvider next.
			bucket := table keys detect: [ :accumulatedProbability | accumulatedProbability > observedValue ].
			effectProvider := table at: bucket.
			Tile withEffect: effectProvider value
			].
	^ self withTiles: tiles
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
