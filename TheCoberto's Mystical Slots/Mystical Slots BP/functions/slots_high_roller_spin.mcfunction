# Deduct cost
scoreboard players remove @s Money 10000

# Roll slot numbers
scoreboard players random @s slot1 1 9
scoreboard players random @s slot2 1 9
scoreboard players random @s slot3 1 9

# Reset result
scoreboard players set @s slotsResult 0

# Triple match Jackpot
execute if score @s slot1 = @s slot2 if score @s slot2 = @s slot3 run scoreboard players set @s slotsResult 3

# Double match Small win
execute unless score @s slotsResult matches 3 if score @s slot1 = @s slot2 run scoreboard players set @s slotsResult 2
execute unless score @s slotsResult matches 3 if score @s slot1 = @s slot3 run scoreboard players set @s slotsResult 2
execute unless score @s slotsResult matches 3 if score @s slot2 = @s slot3 run scoreboard players set @s slotsResult 2

# Payouts
execute if score @s slotsResult matches 3 run scoreboard players add @s Money 290569
execute if score @s slotsResult matches 2 run scoreboard players add @s Money 20000

# Result messages
execute if score @s slotsResult matches 0 run tellraw @s {"rawtext":[{"text":"[§6Mystical Slots§r] No match. Better luck next time!"}]}
execute if score @s slotsResult matches 2 run tellraw @s {"rawtext":[{"text":"[§6Mystical Slots§r] You won §a20000 Money!§r"}]}

# Jackpot broadcast (global)
execute if score @s slotsResult matches 3 run tellraw @a {"rawtext":[{"text":"[§6Mystical Slots§r] "},{"selector":"@s"},{"text":"§a hit the JACKPOT§r with "},{"score":{"name":"@s","objective":"slot1"}},{"text":" | "},{"score":{"name":"@s","objective":"slot2"}},{"text":" | "},{"score":{"name":"@s","objective":"slot3"}},{"text":"!"}]}

# Personal roll readout
tellraw @s {"rawtext":[{"text":"You rolled: "},{"score":{"name":"@s","objective":"slot1"}},{"text":" | "},{"score":{"name":"@s","objective":"slot2"}},{"text":" | "},{"score":{"name":"@s","objective":"slot3"}}]}

# Sounds
playsound random.click @s
execute if score @s slotsResult matches 2 run playsound random.orb @s
execute if score @s slotsResult matches 3 run playsound random.levelup @a
execute if score @s slotsResult matches 0 run playsound mob.villager.no @s
