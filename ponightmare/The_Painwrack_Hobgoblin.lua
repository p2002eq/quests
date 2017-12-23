--The_Painwrack_Hobgoblin (204471)
--Trigger Mob for The_Fearsome_Hobgoblin (204472)
--Hobgoblin_Anguish_Lord Cycle
--ponightmare

function event_death_complete(e)
	eq.unique_spawn(204472, 0, 0, 1679, 4076, 35, 165)	--spawns The_Fearsome_Hobgoblin (204472)
end