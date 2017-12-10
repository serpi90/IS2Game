# Complex Cards (4th iteration)

| Card  | Type     | Effect                              | Target      |
| :---- | :------- | :---------------------------------- | :---------- |
| Redo  | Instant  | Reapplies last tile or instant card | last effect |
| Undo  | Instant  | Reverts last tile or instant card   | last effect |

Last effect targets affect the effect of the last tile or instant card effect.
This includes the _None_ effect of empty tiles (playing _Undo_/_Redo_ after
landing on an empty tile does nothing)

## Undo Card

When a player uses this card, the last effect of tile or instant card is undone,
if the last applied effect was _Atomic Bomb_ then everybody goes back to where
it was before the _Atomic Bomb_.

- Permanent cards are not affected nor counted by _Undo_. If a player lands on
_Speed Up_, then a permanent card is used, and then _Undo_ is used, the undone
effect is _Speed Up_, not the use of the permanent card.
- _Undo_ after _Undo_ is possible, resulting in reaplying the lost effect. This
second _Undo_ can be also be undone, removing again the effect.
- _Undo_ after a _Card Giving_ tile removes a random card of the players hand.
If the player has no cards because the card was permanent and was used, it does
nothing.

## Redo Card

When a player uses this card, the last effect of tile or instant card is applied
again over it's original target.

- Permanent cards are not affected nor counted by _Redo_. If a player lands on
_Speed Up_, then a permanent card is used, and then _Redo_ is used, the effect
to reapply is _Speed Up_, not the use of the permanent card.
- _Redo_ is valid after _Undo_ doing the same effect of _Undo_ after _Undo_.
