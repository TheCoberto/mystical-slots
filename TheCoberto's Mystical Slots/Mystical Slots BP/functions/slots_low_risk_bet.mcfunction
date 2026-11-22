# Only proceed if player has at least 100 Money
execute as @p if score @s Money matches 100.. run function slots_low_risk_spin

# Not enough money — tell them and stop
execute as @p unless score @s Money matches 100.. run tellraw @s {"rawtext":[{"text":"[§6Mystical Slots§r] You need §c100 Money§r to play."}]}
execute as @p unless score @s Money matches 100.. run playsound mob.villager.no @s