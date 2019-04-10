# Software Engineering II - 2017

[![Build Status](https://travis-ci.org/uca-is2/IS2Game.svg)](https://travis-ci.org/uca-is2/IS2Game)
[![Coverage Status](https://coveralls.io/repos/github/uca-is2/IS2Game/badge.svg)](https://coveralls.io/github/uca-is2/IS2Game)

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
| Moonwalk     | Everybody else goes back N tiles           |          5% |
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

## Requirements for third iteration

Each player starts the game with 2 random cards.
More can be gained by landing on a tile that grants a random card.

| card         | type      | effect                                  | target           |
| :----------- | :-------- | :-------------------------------------- | :--------------- |
| Cushioning   | Permanent | Halves the effects of every tile        | global           |
| Overload     | Permanent | A player dice rolls are decreased by 2  | single player    |
| Speed        | Permanent | A player dice rolls are increased by 1  | single player    |
| Cancellation | Instant   | Removes an active permanent card in use | single card      |
| Redo         | Instant   | Reapplies last tile or instant card     | last effect      |
| Undo         | Instant   | Reverts last tile or instant card       | last effect      |

- Permanent cards affect the game from the moment they are played until they are
removed with a cancellation card. Instant cards only affect once when used.
- Single palyer targets affect a player selected by the player.
- Single card targets affect an active card selected by the player.
- Last effect targets affect the effect of the last tile or instant card effect.
This includes the _None_ effect of empty tiles (playing _Undo_/_Redo_ after
landing on an empty tile does nothing)
- _Cushioning_, _Overload_ and _Speed_ speed effect are cumulative.
  - 3x _Cushioning_ active means effects are halved three times = 1/8 effect.
  - 3x _Speed_ increases the player rolls by 3
  - 3x _Overload_ decreases the player rolls by 6
- _Undo_ and _Undo_ is possible, resulting in reaplying the lost effect.
- _Redo_ is valid after _Undo_ doing the same effect of _Undo_ after _Undo_.
