"
An EffectTest is a test class for testing the behavior of Effect
"
Class {
	#name : #EffectTest,
	#superclass : #TestCase,
	#category : 'IS2Game-Tests'
}

{ #category : #'tests-printing' }
EffectTest >> testPrintOn [

	self assert: Effect atomicBomb printString equals: 'Atomic Bomb'.
	self assert: ( Effect moonwalkGoingBack: 2 ) printString equals: 'Moonwalk'.
	self assert: Effect none printString equals: 'Empty'.
	self assert: Effect speedUp printString equals: 'Speed Up'.
	self assert: Effect timeMachine printString equals: 'Time Machine'.
	self assert: Effect wormhole printString equals: 'Wormhole'.
	self
		assert: ( Effect named: 'The Name' affecting: AffectCurrentPlayer new doing: NoEffect new ) printString
		equals: 'The Name'
]
