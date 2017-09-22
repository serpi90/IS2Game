instance creation
movingForward: aNumberOfTiles

	AssertionChecker enforce: [ aNumberOfTiles ~= 0 ] because: 'Move effect can not be 0' raising: InstanceCreationFailed.
	^ self new initializeMovingForward: aNumberOfTiles