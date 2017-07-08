function event_signal(e)
	if (e.signal == 1) then
		e.self:CastSpell(2127,48131,0,0); -- Tragedy at Cazic Thule
		eq.set_timer("2aoe",400);
	elseif(e.signal == 2) then
		e.self:CastSpell(2128,48131); -- Avatar of Fear
		eq.depop();
	end
end

function event_timer(e)
	if (e.timer == "2aoe") then
		eq.stop_timer("2aoe");
		e.self:CastSpell(2127,48131,0,0); -- Tragedy at Cazic Thule
		eq.set_timer("3aoe",400);
	elseif (e.timer == "3aoe") then
		eq.stop_timer("3aoe");
		e.self:CastSpell(2127,48131,0,0); -- Avatar of Fear
		eq.depop();
	end
end