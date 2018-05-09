--#a_marauding_stormrider (215432)
--5 stormriders (untargetable) will charge area where trap is triggered then depop at destionation (FLAVOR NPC)
--poair

function event_spawn(e)
	e.self:SetRunning(true);
	eq.set_timer("loc_check",1);
end

function event_timer(e)
	if e.timer == "loc_check" then
		if (e.self:CalculateDistance(-455,-419,105) <= 5) or (e.self:CalculateDistance(-670,-693,113) <= 5) then	--despawn self once at trap location
			eq.depop();
		end
	end
end