function event_spawn(e)
	spawn = false;
end

function event_combat(e)
	if not spawn then
		eq.settimer(1,1800);
		eq.spawn2(200036,0,0,270,-47,-59,0); 
		eq.spawn2(200037,0,0,319,-25,-59,0); 
		eq.spawn2(200038,0,0,319,-149,-59,0); 
		spawn=true
	end
end

function event_timer(e)
	eq.signal(200036,1); --depop mob 1
	eq.signal(200037,1); --depop mob 2
	eq.signal(200038,1); --depop mob 3
end

function event_death_complete(e)
	eq.spawn2(200035,0,0,408,150,-61.5,135);
end