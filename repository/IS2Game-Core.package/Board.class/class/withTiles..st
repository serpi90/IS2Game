instance creation
withTiles: aTileCollection

	AssertionChecker enforce: [ aTileCollection notEmpty ] because: 'A Board has at least one tile' raising: InstanceCreationFailed.
	^ self new initializeWithTiles: aTileCollection