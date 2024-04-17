#In survival and adventure and keepInventory is false on death in whitelisted dimension run drop
execute as @a[nbt={DeathTime:1s},gamemode=!spectator,gamemode=!creative,predicate=protect_inventory:in_whitelisted_dimension,tag=!pi_ignore] at @s run function protect_inventory:drop

#Protect items from falling in void
execute as @e[tag=pi_owned,predicate=protect_inventory:under_-64] run function protect_inventory:save_from_void
execute as @e[tag=pi_owned,predicate=protect_inventory:under_0_in_end] run function protect_inventory:save_from_void

#Prevent mobs from picking up dropped items
execute at @e[tag=pi_owned] as @e[distance=..3,nbt={CanPickUpLoot:1b}] run function protect_inventory:no_stealing

#Allow mobs to pickup items again
execute as @e[tag=pi_no_stealing] at @s unless entity @e[tag=pi_owned,distance=..3] run function protect_inventory:no_stealing_remove
