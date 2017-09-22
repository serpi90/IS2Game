initialization
printOn: aStream

	aStream
		nextPutAll:
			((tilesToMove positive
				ifTrue: [ 'Move forward <1p> tile<2s>' ]
				ifFalse: [ 'Go back <1p> tile<2s>' ])
				expandMacrosWith: tilesToMove abs
				with:
					(tilesToMove abs = 1
						ifTrue: [ '' ]
						ifFalse: [ 's' ]))