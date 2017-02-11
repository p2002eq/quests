-- #Blood of Ssraeshza (162189) for Emperor event in Ssratemple

-- guards:      Heriz,  Yasiz, Zlakas, Nilasz,  Skzik,  Grziz, Slakiz, Klazaz
guard_list = { 162123, 162124, 162125, 162126, 162127, 162128, 162129, 162130 }

function event_spawn(e) 
	-- depop and deactivate Ssraeshzian Blood Golem on pop
	if eq.get_entity_list():GetNPCByNPCTypeID(162515) ~= nil then
		eq.depop_with_timer(162515);
	end
	-- eq.get_entity_list():GetSpawnByID(368757):Disable();
	
	-- deactivate Emp if he is active for some reason
	eq.signal(162504, 10); 
end

function event_combat(e)
	-- during combat, reaggro the guards on current target every 30 seconds (ensures no idle guards)
	if e.joined then
		aggro_guards(e.self:GetHateTop());
		eq.set_timer('aggro_guards', 30 * 1000);
	else
		eq.stop_timer('aggro_guards');
	end
end

function event_timer(e)
	if e.timer == 'aggro_guards' then
		aggro_guards(e.self:GetHateTop());
	end
end

function event_death_complete(e)
	-- activate emp
	eq.signal(162504, 99);
	-- enable fake blood spawn point - 1 hour respawn on this spawn point functions as 1-hour timer for Emp
	-- eq.get_entity_list():GetSpawnByID(368757):Enable();
end

function aggro_guards(mob)
	for _, guard in pairs(guard_list) do
		local guard_mob = eq.get_entity_list():GetNPCByNPCTypeID(guard);
		if guard_mob ~= nil then
			guard_mob:AddToHateList(mob);
		end
	end
end

-- Event by Kalaylus
