function event_spawn(e)
	eq.set_timer("pass", 240000);
end

function event_timer(e)
	if (e.timer == "pass") then
		e.self:Emote("Who dares defile my temple?! Come forth and face me!");
	end
end
