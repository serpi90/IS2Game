tests-accessing
testPrintOn

	self assert: NoEffect new printString equals: 'No effect'.
	self assert: (MovePlayer movingForward: 3) printString equals: 'Move forward 3 tiles'.
	self assert: (MovePlayer goingBack: 4) printString equals: 'Go back 4 tiles'.
	self assert: (MovePlayer goingBack: 1) printString equals: 'Go back 1 tile'.
	self assert: (UndoTurn goingBack: 1) printString equals: 'Go back 1 turn'.
	self assert: (UndoTurn goingBack: 5) printString equals: 'Go back 5 turns'.
	self
		assert: (AffectEveryone applying: (MovePlayer goingBack: 2)) printString
		equals: 'Everyone: Go back 2 tiles'.
	self
		assert: (AffectEveryone applying: (UndoTurn goingBack: 3)) printString
		equals: 'Everyone: Go back 3 turns'.
	self assert: (RepositionPlayer toLap: 1 tileNumber: 2) printString equals: 'Go to lap 1 tile 2'