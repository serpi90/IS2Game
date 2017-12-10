# Tiles with effect (2nd iteration)

The game board has randomly generated tiles with effects. The tiles in the board
are defined before starting the game.

Each tile has probability of being placed on the board upon generation.

| Tile         | Effect                                     | Probability |
| :----------- | :----------------------------------------- | ----------: |
| Atomic Bomb  | Everybody goes back to the beginning       |          2% |
| Empty        | None                                       |         40% |
| Moonwalk     | Everybody else goes back N tiles           |          5% |
| Speed Up     | Advance 4 tiles                            |         15% |
| Time machine | Player goes back to previous turn position |         23% |
| Wormhole     | Go back 4 tiles                            |         15% |

If a tile moves a player, the effect of the new tile is not applied.

## Atomic Bomb Tile

When a player lands on this tile, everyone goes back to the first tile on the
first lap.

## Empty Tile

Does not have an effect on the player.

## Moonwalk Tile

When a player lands on this tile, everyone but the player goes back N tiles.

The amount of tiles to go back is decided per tile before starting the game. A
random number between 1 and the number of tiles in 1 lap.

## Speed Up Tile

When a player lands on this tile, the player advances 4 extra tiles.

## Time Machine Tile

When a player lands on this tile, the palyer goes back to where it was at the
beginning of the previous turn (not at the beginning of this turn).

If a player lands on the a _Time Machine_ on the first turn, it goes back to the
beginning because there's no previous turn.

Example:
1. Position: `3`. Roll: 2, Land on `5` _Empty_, no effects
2. Position: `5`. Roll: 4, Land on `9` _Time machine_, go back to position `3`
3. Position: `3`. ...

## Wormhole Tile

When a player lands on this tile, the player goes back 4 tiles. It is possible
for the player to go back to a position before the beginning of the game,
because the board is circular.
