#check keepInventory gamerule
function protect_inventory:keep_inventory_check
execute if score .pi_keepinv pi_keepinv matches 1 run return 0

tag @s add pi_dropping
execute if data entity @s Inventory[0] run loot spawn ~ ~ ~ loot protect_inventory:drop
execute as @e[nbt={Item:{tag:{protect_inventory_deathloot:1b}}}] run data merge entity @s {Age:-32768,Invulnerable:1b,Owner:[I;0,0,0,0]}
execute as @e[nbt={Item:{tag:{protect_inventory_deathloot:1b}}},tag=!pi_owned] run data modify entity @s Owner set from entity @a[tag=pi_dropping,limit=1] UUID
tag @e[nbt={Item:{tag:{protect_inventory_deathloot:1b}}},tag=!pi_owned] add pi_owned
execute as @e[nbt={Item:{tag:{protect_inventory_deathloot:1b}}}] at @s run data modify entity @s Item set from entity @s Item.tag.protect_inventory_apply_nbt
kill @e[nbt={Item:{tag:{protect_inventory_deathloot:1b}}}]
clear @s
xp add @s -1 levels
tag @s remove pi_dropping
return 1