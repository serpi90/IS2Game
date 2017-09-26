building
createBoardOfSize: aBoardSize

	^ Board withTiles: ((1 to: aBoardSize) collect: [ :n | self tileAccordingTo: source next ])