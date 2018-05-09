--A_Chaos_Vortex (209157)
--zone: bothunder

function event_spawn(e)
	eq.set_timer("depop", 45 * 60 * 1000);
end

function event_say(e)
	local zone_id = eq.get_zone_id();
	local instance_id = eq.get_zone_instance_id();
	if e.message:findi("hail") then
		e.other:MovePCInstance(zone_id,instance_id,-679,-1739,2255,382);	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
