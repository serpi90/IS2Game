"
A BoardTest is a test class for testing the behavior of Board
"
Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#instVars : [
		'empty',
		'atomicBomb',
		'wormhole',
		'speedUp',
		'moonwalk',
		'timeMachine'
	],
	#category : 'IS2Game-Tests'
}

{ #category : #running }
BoardTest >> setUp [

	super setUp.

	empty := Effect none.
	atomicBomb := Effect atomicBomb.
	wormhole := Effect wormhole.
	speedUp := Effect speedUp.
	moonwalk := Effect moonwalkGoingBack: 3.
	timeMachine := Effect timeMachine
]

{ #category : #'tests-accessing' }
BoardTest >> testBoardGeneration [

	| board |

	board := Board
		ofSize: 200
		withTilesDefinedBy:
			{( 2 percent -> [ Effect atomicBomb ] ).
			( 40 percent -> [ Effect none ] ).
			( 15 percent -> [ Effect wormhole ] ).
			( 15 percent -> [ Effect speedUp ] ).
			( 5 percent -> [ Effect moonwalkGoingBack: 5 atRandom ] ).
			( 23 percent -> [ Effect timeMachine ] )}
		source: ( SequentialGenerator generating: ( 0 to: 99 ) ).

	self
		assert: ( board tiles count: [ :tile | tile effect name = 'Atomic Bomb' ] ) / board length
		equals: 2 percent.
	self
		assert: ( board tiles count: [ :tile | tile effect name = 'Empty' ] ) / board length
		equals: 40 percent.
	self
		assert: ( board tiles count: [ :tile | tile effect name = 'Wormhole' ] ) / board length
		equals: 15 percent.
	self
		assert: ( board tiles count: [ :tile | tile effect name = 'Speed Up' ] ) / board length
		equals: 15 percent.
	self
		assert: ( board tiles count: [ :tile | tile effect name = 'Moonwalk' ] ) / board length
		equals: 5 percent.
	self
		assert: ( board tiles count: [ :tile | tile effect name = 'Time Machine' ] ) / board length
		equals: 23 percent
]

{ #category : #'tests-accessing' }
BoardTest >> testBoardMustHaveAtLeastOneTile [

	self shouldnt: [ Board withTiles: {Tile withoutEffect} ] raise: InstanceCreationFailed.
	self
		should: [ Board withTiles: #() ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'A Board has at least one tile' ]
]

{ #category : #'tests-accessing' }
BoardTest >> testLength [

	self
		assert:
			( Board
				withTiles:
					{Tile withoutEffect.
					Tile withoutEffect} ) length
		equals: 2
]

{ #category : #'tests-building' }
BoardTest >> testProbabilitiesMustAddUpto100Percent [

	self
		should: [ Board
				ofSize: 5
				withTilesDefinedBy:
					{( 10 percent -> [ Effect none ] ).
					( 20 percent -> [ Effect speedUp ] )}
				source: Random new
			]
		raise: InstanceCreationFailed
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Effect probabilities must add to 100% they add to 30%' ].
	self
		should: [ Board ofSize: 5 withTilesDefinedBy: {( 130 percent -> Effect none )} source: Random new ]
		raise: InstanceCreationFailed
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Effect probabilities must add to 100% they add to 130%' ]
]

{ #category : #'tests-accessing' }
BoardTest >> testTileNumbered [

	| firstTile secondTile board |

	firstTile := Tile withoutEffect.
	secondTile := Tile withoutEffect.
	board := Board withTiles: ( Array with: firstTile with: secondTile ).

	self assert: ( board tileNumbered: 1 ) equals: firstTile.
	self assert: ( board tileNumbered: 2 ) equals: secondTile.
	self deny: ( board tileNumbered: 1 ) = secondTile.
	self deny: ( board tileNumbered: 2 ) = firstTile
]

{ #category : #'tests-accessing' }
BoardTest >> testTiles [

	| board tiles |

	tiles := {Tile withoutEffect.
	Tile withoutEffect}.

	board := Board withTiles: tiles.

	self assertCollection: board tiles equals: tiles
]
