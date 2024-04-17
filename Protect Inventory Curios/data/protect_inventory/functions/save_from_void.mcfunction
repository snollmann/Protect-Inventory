execute as @s[predicate=protect_inventory:under_0_in_end] at @s run tp @s ~ 0 ~
execute as @s[predicate=protect_inventory:under_-64] at @s run tp @s ~ -64 ~
data merge entity @s {NoGravity:1b,Motion:[0.0,0.01,0.0]}