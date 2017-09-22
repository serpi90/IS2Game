accessing
printOn: aStream

	aStream nextPutAll: ('Go to lap <1p> tile <2p>' expandMacrosWith: lap with: tileNumber)