rolling
printOn: aStream

	(dice groupedBy: [ :die | die sides ]) associations
		do: [ :sidesToDice | 
			aStream
				print: sidesToDice value size;
				nextPut: $d;
				print: sidesToDice key ]
		separatedBy: [ aStream space ]