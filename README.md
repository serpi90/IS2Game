# Software Engineering II - IS2Game

[![Build Status](https://travis-ci.org/uca-is2/IS2Game.svg)](https://travis-ci.org/uca-is2/IS2Game)
[![Coverage Status](https://coveralls.io/repos/github/uca-is2/IS2Game/badge.svg)](https://coveralls.io/github/uca-is2/IS2Game)

Exercise of modeling a board game for teaching purpouses.

The game simulates a board game, with multiple players over a circular path of tiles, won by the first player to complete a number of laps around the board.

- Movement is determinated by dice rolls.
- Some tiles may have effects over the player/players.
- Some tiles will make the player draw cards, which also have effects over the player/players.

## Version 1

On the board game, several players play in sequence, these players throw dice and advance by the sum of the dice.

The game is won by the first player to get to the end of the board.

The board has N tiles in sequence. The amount of dice, the number faces of those and the board length can vary from game to game, but remain constant during the same game.

### Requirements for version 1

- [x] Support N sided dice.
- [x] Support M dices with varying sizes.
- [x] Game supports more than one player.
- [x] Turn order must be enforced.
- [x] You can tell if the game ended.
- [x] You can know who was the winner of the game.
- [x] You can know the position in the board of any player during the game and when the game finished.
- [x] You can know the ranking (1st, 2nd, 3rd, etc.) of any player during the game and when the game finished.

## Version 2

The board is now circular, after crossing the finish line, you get back to the first tile.
The winner is the first one to do X laps around the board.

Also, some tiles now have an effect.
When a player lands on the tile, the effect of that tile is applied.
If a player is moved by effect of a tile, and lands on another tile, this does **NOT** cause a new effect.

The game board has randomly generated tiles with effects, these may vary from game to game, but remain the same during a game.

Each tile has probability of bein placed on the board upon generation.

| Tile         | Effect                                     | Probability |
| :----------- | :----------------------------------------- | ----------: |
| Atomic Bomb  | Everybody goes back to the beginning       |          2% |
| Empty        | None                                       |         55% |
| Moonwalk     | Everybody else goes back N tiles           |          5% |
| Speed up     | Advance 4 tiles                            |         15% |
| Time machine | Player goes back to previous turn position |          8% |
| Wormhole     | Go back 4 tiles                            |         15% |

- Wormhole
  - If it makes the player go back from the beginning, it's considered to be on a negative lap.
- Moonwalk
  - Every other player goes back N tiles.
  - Does not affect the player landing on the tile.
  - The numer N of tiles to go back goes back varies from tile to tile, meaning different tiles can have different N on the same board, but the number remains constant for every tile.
- AtomicBomb
  - Every goes back to the first tile of the board.
  - The number of laps done by each players does not change.
- Time Machine
  - Player goes back to previous turn, not at the beginning of the current one.
  - Example
    1. Position: 3. Roll: 2, Land on 5 _Empty_, no effect.
    2. Position: 5. Roll: 4, Land on 9 _Time machine_, go back to position 3.

### Requirements for version 2

- [x] Everything indicated for version 1
- [x] Implemented circular board with X laps, X can be configured for every game.
- [x] You can know the lap of any player during the game and when the game finished.
- [x] Atomic Bomb is implemented.
- [x] Empty is implemented.
- [x] Moonwalk is implemented.
- [x] Speed up is implemented.
- [x] Time machine is implemented.
- [x] Wormhole is implemented.
- [x] Board can be randomly generated based on the given probabilities.

## Version 3

Each player starts the game with 2 random cards.
More can be gained by landing on a tile that grants a random card to the player landing on that tile.

- Empty tile has now 45% probability of appearing.
- Card giving tile has 10% probability of appearing.
- Card giving tile gives cards with uniform probability.

There are 2 card types, instant and permanent. This affects when they can be used, and when the effect it's applied.

- **Instant cards:** Can be played at any time (regardless of whether it is the player's turn or not, but not when the game is over). They take effect only when they are used.
- **Permanent cards:** Can be played only during the player's turn. Once used, they remain in play making an effect until they are removed.

### Considerations

- The cards in the player's hand have no effect on the game.
- Once a card is played, it stops being in the player's hand.
  - If it is instantaneous, it is discarded.
  - If it is permanent, apply its effect until it is removed.
- In order to play a card, it has to be in the player's hand.
- There is no limit to the number of cards in the hand, or to the number of cards in play, or to the number of cards that can be obtained (the deck is infinite and generates random cards with uniform distribution).

### Cards

| Card         | Type        | Effect                          |
| :----------- | ----------: | :------------------------------ |
| Overload     | Permanent   | Player roll - 2                 |
| Speed        | Permanent   | Player roll + 1                 |
| Acceleration | Permanent   | Everybody rolls + 1             |
| Cancellation | Instant     | Remove an active permanent card |
| Redo         | Mixed       | Same effect as last card played |
| Repeat       | Instant     | Apply the last tile efect again |

- Overload: Permanent card that reduces the total roll of a player of choice by 2.
  - It affects the total roll, not each individual die.
  - If the result is negative, go back.
  - The effect is cumulative.

- Speed: Permanent card that increases by 1 the total roll of a player of his choice.
  - It affects the total roll, not each individual die.
  - The effect is cumulative.

- Acceleration: Permanent card that increases in 1 the total roll of all the players.
  - It affects the total roll, not each individual die.
  - The effect is cumulative.

- Cancellation: Instant card that removes an active permanent card from the game.
  - The card is chosen, it is not random.
  - You can not play if there are no permanent cards in effect.

- Redo: Card that has the same effect as the last card that was played.
  - If the last card is instantant, it acts as an instant card.
  - If the last card is permanent, it acts as permanent card.
  - If the card indicates that a player or card must be chosen, it does not have to be the same.

- Repeat: Instant Card reapplies the effect of the last tile on which a player fell after rolling the dice.
  - If the tile has no effect, then this card has no effect.
  - If nobody has thrown the dice, then this card can not be used.

### Requirements for version 3

- [x] Everything indicated for versions 1 and 2.
- [x] Implemented Overload card.
- [x] Implemented Speed chart.
- [x] Implemented Acceleration card.
- [ ] Implemented Cancellation card.
- [ ] Implemented Redo card.
- [ ] Implemented Repeat card.
- [ ] Implemented Card giving tile.
- [ ] Cards must be on the player's hand to be played.