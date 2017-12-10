# Basic Cards (3rd iteration)

Each player starts the game with 2 random cards.
More can be gained by landing on a tile that grants a random card.

There are 2 types of cards, _Permanent_ cards, which once played become _Active_
and have effect until the game ends or they are removed. And _Instant_ cards,
which have effect only once when used.

_Permanent_ cards can only be used by players on their turn, before rolling the
dice.

| Card         | Type      | Effect                                  |
| :----------- | :-------- | :-------------------------------------- |
| Cushioning   | Permanent | Halves the effects of every tile        |
| Overload     | Permanent | A player dice rolls are decreased by 2  |
| Speed        | Permanent | A player dice rolls are increased by 1  |
| Cancellation | Instant   | Removes an active permanent card in use |

## Card Giving Tile

When a player lands on this tile, it adds one random card to it's hand.

This tile has a 10% chance of being placed on the board (_Empty_ reduced to 30%)

## Speed Card

This card affects one player, and increases all it's dice rolls by 1. The result
is cumulative, so 3 _Speed_ increases the player rolls by 3

The increase is over the total roll, not the individual dice.
Rolling 2d6 and getting 3 and 4, +1 for Speed = 8 total roll.

## Overload Card

Behaves similar to _Speed_ but decreases all rolls by 2, if the result is
negative the player must go backward.

## Cushioning Card

This card halves every tile effect (for every player) as long as it is active.
- Speed Up only advances 2 tiles
- Wormhole only goes back 2 tiles
- Moonwalk everybody else goes back N/2 tiles
- Has no effect over _Time Machine_, _Empty_ or _Atomic Bomb_

The effect is cumulative, having 3 active _Cushioning_ means effects are
halved three times = 1/8 effect.

The resulting effect is rounded up: _Speed Up_ + 3 _Cushioning_ results in:
`4 tiles * 1/8 = 1/2 tile` rounded up to 1 tile.

## Cancellation Card

This card removes a selected active permanent card from the game, removing it's
effect from the game.
