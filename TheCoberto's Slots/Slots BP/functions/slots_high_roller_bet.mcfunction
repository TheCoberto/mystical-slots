# Only proceed if player has at least 10000 Money
execute as @p if score @s Money matches 10000.. run function slots_high_roller_spin

# Not enough money — tell them and stop
execute as @p unless score @s Money matches 10000.. run tellraw @s {"rawtext":[{"text":"[§6Mystical Slots§r] You need §c10000 Money§r to play."}]}
execute as @p unless score @s Money matches 10000.. run playsound mob.villager.no @s