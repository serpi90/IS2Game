tests
testCanNotUndoANegativeNumberOfTurns

	self should: [ UndoTurn goingBack: -3 ] raise: InstanceCreationFailed withExceptionDo: [ :signal | self assert: signal messageText equals: 'Can not undo a negative player of turns' ]