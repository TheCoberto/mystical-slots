import { system, world } from "@minecraft/server";
import { ActionFormData } from "@minecraft/server-ui";

// Slot machine block (coberto:slot_machine). Using it opens a menu to pick a
// bet, then runs that bet's slots function (functions/slots_*_bet.mcfunction),
// which checks the player's Money, spins and pays out. The functions still
// work on their own too, e.g. from a command block.
//
// Keep this file the same in Coberto's Utilities and Slot Machine.

// Shown in the menu only. The real costs and payouts are in the functions,
// so change both together.
const BETS = [
	{ name: "Low Risk", cost: 100, pair: 200, jackpot: 2905, fn: "slots_low_risk_bet" },
	{ name: "High Roller", cost: 10000, pair: 20000, jackpot: 290569, fn: "slots_high_roller_bet" },
];

// Scoreboards the slots functions need. Any that don't exist yet are created
// before the first spin, otherwise a spin would take the bet and roll nothing.
const OBJECTIVES = ["Money", "slot1", "slot2", "slot3", "slotsResult"];

const playersInMenu = new Set();

system.beforeEvents.startup.subscribe(({ blockComponentRegistry }) => {
	try {
		blockComponentRegistry.registerCustomComponent("coberto:slot_machine", {
			onPlayerInteract: ({ player }) => {
				if (player) openMenu(player);
			},
		});
	} catch {
		// Utilities and Slot Machine both include this script. If both are
		// installed, the first one registers the machine and handles it.
	}
});

async function openMenu(player) {
	if (playersInMenu.has(player.id)) return;
	playersInMenu.add(player.id);
	try {
		const form = new ActionFormData()
			.title("§6Mystical Slots")
			.body(
				`Balance: §a${formatNumber(getMoney(player))} Money§r\n\n` +
					"Roll three numbers from 1 to 9. Match two to win, or all three for the jackpot!"
			);
		for (const bet of BETS) {
			form.button(
				`${bet.name}: ${formatNumber(bet.cost)}\n§8Pair ${formatNumber(bet.pair)} | Jackpot ${formatNumber(bet.jackpot)}`
			);
		}

		const response = await form.show(player);
		if (response.canceled || response.selection === undefined || !player.isValid) return;

		addMissingObjectives();
		player.runCommand(`function ${BETS[response.selection].fn}`);
	} catch (e) {
		console.warn(`[Slot Machine] ${e}`);
	} finally {
		playersInMenu.delete(player.id);
	}
}

function getMoney(player) {
	try {
		return world.scoreboard.getObjective("Money")?.getScore(player) ?? 0;
	} catch {
		return 0;
	}
}

function addMissingObjectives() {
	for (const id of OBJECTIVES) {
		if (!world.scoreboard.getObjective(id)) world.scoreboard.addObjective(id, id);
	}
}

function formatNumber(n) {
	return String(n).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
