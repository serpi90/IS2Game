testing
is: chance includedIn: probabilityRange

	| lowerBound upperBound |

	lowerBound := probabilityRange key.
	upperBound := probabilityRange value.
	^ chance >= lowerBound and: [ chance < upperBound ]