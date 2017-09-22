tests
testPrintOn

	self assert: Tile empty printString equals: 'Empty Tile'.
	self assert: (Tile doing: (MovePlayer movingForward: 3) named: 'Named') printString equals: 'Named Tile'