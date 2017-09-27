accessing
gameWithBoardLength: aNumberOfTiles for: players

	^ self gameWithTiles: (self emptyTiles: aNumberOfTiles) rolling: #(1) for: players