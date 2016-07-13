function event_signal(e)
	if (e.signal == 1) then
		e.self:CastSpell(2127,214104,0,0); 	-- cast aoe dd
		eq.set_timer("2aoe",400);
	elseif(e.signal == 2) then
		e.self:CastSpell(2128,214104); 	-- cast aoe skele
		eq.depop();
	end
end

function event_timer(e)
	if (e.timer == "2aoe") then
		eq.stop_timer("2aoe");
		e.self:CastSpell(2127,214104,0,0); 	-- cast aoe dd
		eq.set_timer("3aoe",400);
	elseif (e.timer == "3aoe") then
		eq.stop_timer("3aoe");
		e.self:CastSpell(2127,214104,0,0); 	-- cast aoe dd
		eq.depop();
	end
end