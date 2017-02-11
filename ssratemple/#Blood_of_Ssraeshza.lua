-- #Blood of Ssraeshza (162189) for Emperor event in Ssratemple

-- guards:      Heriz,  Yasiz, Zlakas, Nilasz,  Skzik,  Grziz, Slakiz, Klazaz
guard_list = { 162123, 162124, 162125, 162126, 162127, 162128, 162129, 162130 }

function event_spawn(e) 
	-- depop and deactivate Ssraeshzian Blood Golem on pop
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(162515) then
		eq.set_timer('depop_golem', 500);
	end
	local fbs = eq.get_entity_list():GetSpawnByID(368757);
	if fbs:Enabled() then
		eq.zone_emote(1, 'Enabled');
	else
		eq.zone_emote(1, 'Disabled');
	end
	eq.zone_emote(1, 'timer is ' .. fbs:RespawnTimer());
	eq.zone_emote(1, 'NPC is ' .. fbs:CurrentNPCID());
	eq.get_entity_list():GetSpawnByID(368757):Disable();
	
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
	elseif e.timer == 'depop_golem' then
		eq.stop_timer(e.timer);
		eq.depop_with_timer(162515);
	end
end

function event_death_complete(e)
	-- activate emp
	eq.signal(162504, 99);
	-- enable fake blood spawn point
	local fbs = eq.get_entity_list():GetSpawnByID(368757);
	if fbs:Enabled() then
		eq.zone_emote(1, 'Enabled');
	else
		eq.zone_emote(1, 'Disabled');
	end
	eq.zone_emote(1, 'timer is ' .. fbs:RespawnTimer());
	eq.zone_emote(1, 'NPC is ' .. fbs:CurrentNPCID());
	fbs:Enable();
	if fbs:Enabled() then
		eq.zone_emote(1, 'Enabled');
	else
		eq.zone_emote(1, 'Disabled');
	end
	eq.zone_emote(1, 'timer is ' .. fbs:RespawnTimer());
	eq.zone_emote(1, 'NPC is ' .. fbs:CurrentNPCID());
	fbs:Repop();
	fbs:Reset();
	-- fbs:SetRespawnTimer(10 * 1000);
	eq.stop_timer('aggro_guards');
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
