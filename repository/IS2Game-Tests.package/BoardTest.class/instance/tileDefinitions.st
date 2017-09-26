tests-accessing
tileDefinitions

	^ {(TileProbablity forTile: atomicBomb chance: 2 percent).
	(TileProbablity forTile: empty chance: 40 percent).
	(TileProbablity forTile: wormhole chance: 15 percent).
	(TileProbablity forTile: speedUp chance: 15 percent).
	(TileProbablity forTile: moonwalk chance: 5 percent).
	(TileProbablity forTile: timeMachine chance: 23 percent)}