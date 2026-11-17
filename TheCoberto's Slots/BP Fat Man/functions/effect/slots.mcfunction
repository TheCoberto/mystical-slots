scoreboard players remove @s Money 10
scoreboard players random @s slot1 1 9
scoreboard players random @s slot2 1 9
scoreboard players random @s slot3 1 9
scoreboard players set @s lastResult 0
execute if score @s slot1 = @s slot2 if score @s slot2 = @s slot3 run scoreboard players set @s lastResult 3
execute unless score @s lastResult matches 3 if score @s slot1 = @s slot2 run scoreboard players set @s lastResult 2
execute unless score @s lastResult matches 3 if score @s slot1 = @s slot3 run scoreboard players set @s lastResult 2
execute unless score @s lastResult matches 3 if score @s slot2 = @s slot3 run scoreboard players set @s lastResult 2
execute if score @s lastResult matches 3 run scoreboard players add @s Money 250
execute if score @s lastResult matches 2 run scoreboard players add @s Money 50
execute if score @s lastResult matches 0 run tellraw @s {"rawtext":[{"text":"[Slot] No match. Better luck next time!"}]}
tellraw @s {"rawtext":[
  {"text":"[Slot] You rolled: "},
  {"score":{"name":"@s","objective":"slot1"}},{"text":" | "},
  {"score":{"name":"@s","objective":"slot2"}},{"text":" | "},
  {"score":{"name":"@s","objective":"slot3"}}
]}
tag @s remove spin_slot
