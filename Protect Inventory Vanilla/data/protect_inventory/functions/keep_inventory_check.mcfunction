execute store result score .pi_keepinv pi_keepinv run gamerule keepInventory
execute if score .pi_keepinv pi_keepinv matches 1 run return 1
execute if score .pi_keepinv pi_keepinv matches 0 run return 0