I represent a sequence of numbers

I provide a polymorphic alternative to `Random>>#nextInt:` answering with a predetermined sequence of numbers.

I am given that sequence of numbers when created.

Example:
```
sequence := SequentialGenerator generating: #(1 2 3 4).
sequence nextInt: 5. "1"
sequence nextInt: 5. "2"
sequence nextInt: 5. "3"
sequence nextInt: 3. "1. (reminder of 4 / 3)"
sequence nextInt: 3. "1"
sequence nextInt: 3. "1"
```
 
Instance Variables
	sequence:		<SequenceableCollection of numbers>
