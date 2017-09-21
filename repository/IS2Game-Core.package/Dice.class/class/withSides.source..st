instance creation
withSides: anInteger source: aNumberSource

	AssertionChecker enforce: [ anInteger >= 2 ] because: 'A dice must at least have 2 sides' raising: InstanceCreationFailed.
	^ self new initializeWithSides: anInteger source: aNumberSource