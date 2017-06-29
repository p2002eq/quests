--on death spawns the Avatar of War

function event_death_complete(e)
	eq.spawn2(113627,0,0,1291,1252,-97,254.5);  --spawns Avatar of War
	eq.set_global("Idol","2",3,"D6");			--sets qglobal value to 2 (Idol dead)
end
