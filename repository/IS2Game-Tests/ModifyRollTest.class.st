Class {
	#name : #ModifyRollTest,
	#superclass : #TestCase,
	#category : #'IS2Game-Tests'
}

{ #category : #tests }
ModifyRollTest >> testPrintOn [

	self
		assert: ( ModifyRoll decreaseBy: 3 ) printString equals: 'Modify roll by: -3';
		assert: ( ModifyRoll increaseBy: 2 ) printString equals: 'Modify roll by: 2'
]
