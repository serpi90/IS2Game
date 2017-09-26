building
tileAccordingTo: chance

	^ tileProbabilities at: (tileProbabilities keys detect: [ :probabilityRange | self is: chance includedIn: probabilityRange ])