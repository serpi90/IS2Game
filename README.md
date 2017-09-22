# Software Engineering II - 2017

Exercise of modeling a board game for teaching purpouses.

The game simulates a board game, with multiple players over a circular path of tiles, won by the first player to complete a number of laps around the board.
- Movement is determinated by dice rolls
- Some tiles may have effects over the player/players
- Some tiles will make the player draw cards, which also have effects over the player/players

## Requirements for first iteration
- Support N sided dice
- Support M dices with varying sizes
- Game supports more than one player
- Number of laps per game can be configured
- Turn order must be enforced
- Winner is accessible once the game has ended

## Requirements for second iteration

The game board has randomly generated tiles with effects.

Each tile has probability of bein placed on the board upon generation.

| tile         | effect                                     | probability |
| :----------- | :----------------------------------------- | ----------: |
| Atomic Bomb  | Everybody goes back to the beginning       |          2% |
| Empty        | None                                       |         40% |
| Moonwalk     | Everybody goes back N tiles                |          5% |
| Speed up     | Advance 4 tiles                            |         15% |
| Time machine | Player goes back to previous turn position |         23% |
| Wormhole     | Go back 4 tiles                            |         15% |

- All tile effects implemented
- Moonwalk number of tiles can be configured
- Time machine goes to previous turn, not at the beginning of the current one:
  1. Position: 3. Roll: 2, Land on 5 _Empty_, no effects
  2. Position: 5. Roll: 4, Land on 9 _Time machine_, go back to position 3
  3. Position: 3. ...
- Board can be randomly generated based on the given probabilities
