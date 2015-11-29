function event_spawn(e)
	eq.set_timer("pass", 30);
end

function event_timer(e)
	if (e.timer == "pass") then
		e.self:Emote("blows through the cavern.");
	end
end
