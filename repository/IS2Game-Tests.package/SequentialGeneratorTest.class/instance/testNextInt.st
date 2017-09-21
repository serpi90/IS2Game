tests-accessing
testNextInt

	| generator |
	generator := SequentialGenerator generating: #(1 6 8).
	self assert: (generator nextInt: 6) equals: 1.
	self assert: (generator nextInt: 6) equals: 6.
	self assert: (generator nextInt: 6) equals: 2.
	self assert: (generator nextInt: 6) equals: 1.
	self assert: (generator nextInt: 6) equals: 6.
	self assert: (generator nextInt: 6) equals: 2