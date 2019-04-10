Class {
	#name : #BaselineOfIS2Game,
	#superclass : #BaselineOf,
	#category : 'BaselineOfIS2Game'
}

{ #category : #baselines }
BaselineOfIS2Game >> baseline: spec [

	<baseline>
	spec
		baseline: 'Buoy'
		with: [ spec
				repository: 'github://ba-st/Buoy:v5/source';
				loads: #('Deployment') ].
	spec
		for: #common
		do: [ spec
				package: 'IS2Game-Core' with: [ spec requires: 'Buoy' ];
				package: 'IS2Game-Tests' with: [ spec requires: 'IS2Game-Core' ].
			spec
				group: 'Deployment' with: #('IS2Game-Core');
				group: 'Development' with: #('IS2Game-Tests');
				group: 'default' with: #('Deployment') ]
]
