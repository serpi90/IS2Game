tests-accessing
testCanNotMoveForwardOrBackwardZeroTiles

	self
		should: [ MovePlayer movingForward: 0 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Move effect can not be 0' ].
	self
		should: [ MovePlayer goingBack: 0 ]
		raise: InstanceCreationFailed
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Move effect can not be 0' ]