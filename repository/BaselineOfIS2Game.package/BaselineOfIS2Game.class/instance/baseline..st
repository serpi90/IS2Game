baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'IS2Game-Core';
				package: 'IS2Game-Tests' with: [ spec requires: 'IS2Game-Core' ].
			spec
				group: 'Deployment' with: #('IS2Game-Core');
				group: 'Development' with: #('IS2Game-Tests');
				group: 'default' with: #('Deployment') ]