function event_spawn(e)
	e.self:Say("All to me!");
	eq.set_timer("depop", 10 * 60 * 1000) -- 10min depop
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_say(e)
	local instance_id = eq.get_instance_id();
	if e.message:findi("hail") then
		e.other:Message(9,"Kill the stormlord!");
		e.other:MovePCInstance(209,instance_id, -727,-1662,1728);
	end
end