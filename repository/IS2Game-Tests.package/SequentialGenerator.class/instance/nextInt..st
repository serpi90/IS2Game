accessing
nextInt: maximum

	| int |
	int := sequence current rem: maximum.
	sequence next.
	^ int = 0
		ifTrue: [ maximum ]
		ifFalse: [ int ]