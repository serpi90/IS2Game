Extension { #name : #SequenceableCollection }

{ #category : #'*IS2Game-Core' }
SequenceableCollection >> detectLast: aBlock [

	^ self detectLast: aBlock ifNone: [ self errorNotFound: aBlock ]
]

{ #category : #'*IS2Game-Core' }
SequenceableCollection >> detectLast: aBlock ifFound: aFoundBlock [

	self detectLast: aBlock ifFound: aFoundBlock ifNone: [ "Do nothing on purpose" ]
]

{ #category : #'*IS2Game-Core' }
SequenceableCollection >> detectLast: aBlock ifFound: aFoundBlock ifNone: aNoneBlock [

	| index |

	index := self findLast: aBlock.
	^ index = 0
		ifTrue: aNoneBlock
		ifFalse: [ aFoundBlock cull: ( self at: index ) ]
]

{ #category : #'*IS2Game-Core' }
SequenceableCollection >> detectLast: aBlock ifNone: aNotFoundBlock [

	^ self detectLast: aBlock ifFound: #yourself ifNone: aNotFoundBlock
]
