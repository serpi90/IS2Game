accessint
next

	| int |

	int := sequence current rem: 100.
	sequence next.
	^ int / 100