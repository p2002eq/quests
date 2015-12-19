function event_spawn(e)
	eq.set_timer("pass", 30000); --30 seconds
end

function event_timer(e)
	if (e.timer == "pass") then
		e.self:Emote("blows through the cavern.");
	end
end
