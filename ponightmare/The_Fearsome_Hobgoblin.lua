--The_Fearsome_Hobgoblin (204472)
--Trigger Mob for Hobgoblin_Anguish_Lord (204473)
--Hobgoblin_Anguish_Lord Cycle
--ponightmare

function event_death_complete(e)
	eq.unique_spawn(204473, 0, 0, 1486, 2652, -80, 380)	--spawns Hobgoblin_Anguish_Lord (204473)
	eq.unique_spawn(204477, 0, 0, 1486, 2663, -80, 380)	--spawns a_fearsome_bat(rooted)
	eq.unique_spawn(204476, 0, 0, 1486, 2640, -80, 380)	--spawns a_malevolent_mephit (rooted)
end
