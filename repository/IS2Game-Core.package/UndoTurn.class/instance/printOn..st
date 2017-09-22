initialization
printOn: aStream

	aStream
		nextPutAll:
			('Go back <1p> turn<2s>'
				expandMacrosWith: turns
				with:
					(turns = 1
						ifTrue: [ '' ]
						ifFalse: [ 's' ]))