tests
testUndoTurnWithFewerHistoryThanNeded

	"History should always have at least 2 elements when the effect is applied (See testUndoTurn comment)"

	2 to: 4 do: [ :historySize | 
		playerHistory := ((1 to: historySize)
			collect: [ :n | PlayerPosition of: player onLap: 0 tileNumber: n ]) asOrderedCollection.
		self assert: (self positionOf: player) equals: playerHistory last.
		(UndoTurn goingBack: 2) affectTurnOf: player on: self.
		self assert: player isOnLap: 0 tileNumber: 1 ]