instance creation
goingBack: aNumberOfTurns

	AssertionChecker enforce: [ aNumberOfTurns >= 0 ] because: 'Can not undo a negative player of turns' raising: InstanceCreationFailed.
	^ self new initializeGoingBack: aNumberOfTurns