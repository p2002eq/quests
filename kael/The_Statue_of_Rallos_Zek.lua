--The_Statue_of_Rallos_Zek(NPC # 113628)
-- On death, spawns the Idol of Rallos Zek and sets qglobal to indicate position in cycle

function event_death_complete(e)
    e.self:Shout("Protect the Idol of Zek!");
	eq.spawn2(113629,0,0,1292,1267,-35,254.5); -- Idol of Rallos Zek
	eq.set_global("Idol","1",3,"D6");
end

function event_spawn(e)
    eq.depop_all(113629);  --Despawns Idol of Zek
	eq.delete_global("Idol");
end