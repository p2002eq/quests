function event_spawn(e)
	eq.set_timer("corpse",2*1000);
end

function event_timer(e)
	if e.timer == "corpse" then
		e.self:SetAppearance(3);
		eq.stop_timer(e.timer);
	end
end

--corpse in the pit in PoTactics