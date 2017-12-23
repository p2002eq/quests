--The_Bullyrag_Bat (204470)
--Trigger Mob for The_Painwrack_Hobgoblin (204471)
--Hobgoblin_Anguish_Lord Cycle
--ponightmare

function event_death_complete(e)
	eq.unique_spawn(204471, 0, 0, 730, 4568, -95, 120)	--spawns The_Painwrack_Hobgoblin (204471)
end