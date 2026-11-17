# slot-machine

**Slot Machine** is a Minecraft Bedrock add-on that adds a **Slot Machine** block (in the creative inventory under Items). Use it to open the Mystical Slots menu and bet from your `Money` scoreboard score:

| Bet | Cost | Match two | Match three (jackpot) |
| --- | --- | --- | --- |
| Low Risk | 100 | 200 | 2,905 |
| High Roller | 10,000 | 20,000 | 290,569 |

Each spin rolls three numbers from 1 to 9. A jackpot is announced to everyone. The scoreboards it needs (`Money`, `slot1`, `slot2`, `slot3`, `slotsResult`) are created automatically. Give players money with `/scoreboard players add <player> Money <amount>`.

The bets are plain functions, so they also work without the block, e.g. from a command block button: `/function slots_low_risk_bet` or `/function slots_high_roller_bet`.

No experimental toggles needed. It uses only stable Script API features (`@minecraft/server` 2.11.0, `@minecraft/server-ui` 2.0.0).

## Also in Coberto's Utilities

The same slot machine is part of [Coberto's Utilities](https://github.com/TheCoberto/coberto-utilities). Install one or the other, not both. Keep these files the same in both repos:
- `blocks/slot_machine.json`, `scripts/slot_machine.js` and the `functions/slots_*.mcfunction` files
- `blocks.json`, `textures/terrain_texture.json` (apart from `resource_pack_name`), `textures/blocks/slot_machine_*.png` and the `tile.coberto:slot_machine.name` line in `texts/en_US.lang`

## Building

Use `package.ps1` from [bedrock-tools](https://github.com/TheCoberto/bedrock-tools), cloned next to this repo:

```powershell
powershell -ExecutionPolicy Bypass -File ..\bedrock-tools\package.ps1
```
