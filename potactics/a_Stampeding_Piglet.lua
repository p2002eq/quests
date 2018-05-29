--a_Stampeding_Piglet (214291)

local wave;

function event_spawn(e)
	wave = 1;
	e.self:SetRunning(true);
	spawn_boars();	
	eq.set_timer("waves", 2 * 1000);
	eq.zone_emote(0, "You hear the pounding of hooves.");
end

function event_timer(e)
	if e.timer == "waves" then
		if wave < 6 then
			wave = wave + 1;
			spawn_boars();
		end
	end
end

function event_waypoint_arrive(e)
	if (e.wp == 6) then
		eq.depop();
	end
end

function spawn_boars()	--spawn all of the a_Stampeding_Boar to run along with me!
	for n = 1,4 do 
		eq.spawn2(214290,189,0,1197 + math.random(-20,20),-711 + math.random(-20,20),-290,0);
	end
end