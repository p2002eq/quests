function event_spawn(e)
	eq.set_timer(1,10);
end

function event_timer(e)
	if e.timer == 1 then
		e.self:SetAppearance(3);
		eq.stop_timer(1);
	end
end

--corpse in the pit in PoTactics