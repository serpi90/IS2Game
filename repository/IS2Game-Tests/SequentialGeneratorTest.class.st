"
A SequentialGeneratorTest is a test class for testing the behavior of SequentialGenerator
"
Class {
	#name : #SequentialGeneratorTest,
	#superclass : #TestCase,
	#category : 'IS2Game-Tests'
}

{ #category : #'tests-accessing' }
SequentialGeneratorTest >> testNextInt [

	| generator |
	generator := SequentialGenerator generating: #(1 6 8).
	self assert: (generator nextInt: 6) equals: 1.
	self assert: (generator nextInt: 6) equals: 6.
	self assert: (generator nextInt: 6) equals: 2.
	self assert: (generator nextInt: 6) equals: 1.
	self assert: (generator nextInt: 6) equals: 6.
	self assert: (generator nextInt: 6) equals: 2
]
