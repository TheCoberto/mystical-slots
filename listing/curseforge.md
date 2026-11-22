# CurseForge listing: Mystical Slots

Paste these into the CurseForge Authors Console. Once the project is approved, CurseForge syncs it to MCPEDL.

## Project

- **Name:** Mystical Slots: Slot Machine Casino Game
- **Slug:** `mystical-slots` (new project, so any free slug works)
- **Summary:** A Slot Machine block for servers and Realms: bet from your Money score on Low Risk or High Roller spins and hit the jackpot.
- **Class:** Minecraft Bedrock, Addons
- **Project Distribution** (License section): allow third-party distribution, or it won't show on MCPEDL
- **Logo:** promo/logo.png
- **Gallery:** promo/banner.png titled `MCPEDL` (used as the MCPEDL thumbnail), plus screenshots: the block, the Mystical Slots menu, a jackpot announcement.

## Description

Give your server's economy somewhere to go. Place a Slot Machine at spawn, and players can bet their Money on a spin of the Mystical Slots. Match two to double your bet, or match all three for a jackpot that gets announced to everyone. No experiments needed.

Find the **Slot Machine** block in the creative inventory under Items. Use it to open the Mystical Slots menu and pick a bet:

- **Low Risk**: costs 100. Match two wins 200, match three wins 2,905.
- **High Roller**: costs 10,000. Match two wins 20,000, match three wins 290,569.

Each spin rolls three numbers from 1 to 9. Jackpots are announced to the whole server.

Bets come out of the `Money` scoreboard, which is created automatically. Give players money with `/scoreboard players add <player> Money <amount>`, or pair it with an add-on that pays players Money.

Prefer command blocks? `/function slots_low_risk_bet` and `/function slots_high_roller_bet` work without the block, for example behind a button.

### Installation

1. Download the .mcaddon and open it. Minecraft imports both packs.
2. Create or edit a world and turn on the Mystical Slots behavior pack (the resource pack is added with it). No experiments needed.
3. Don't use it alongside Coberto's Utilities, which already includes Mystical Slots.

### Supported Minecraft versions

1.26.60 and newer

### Changelog

**2.1.0**
- Slot Machine is now called Mystical Slots, its original name. The block is still the Slot Machine, and existing worlds keep working

**2.0.0**
- Rebuilt around a Slot Machine block with a menu
- No experiments needed

## File

- **File:** `builds\Mystical-Slots-2.1.0.mcaddon`
- **Display name:** Mystical Slots 2.1.0
- **Release type:** Release
- **Game versions:** 1.26.60 and newer
- **Changelog:**

- Slot Machine is now called Mystical Slots, its original name. The block is still the Slot Machine, and existing worlds keep working
