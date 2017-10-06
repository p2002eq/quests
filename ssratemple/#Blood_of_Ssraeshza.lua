-- #Blood of Ssraeshza (162189) for Emperor event in Ssratemple

-- guards:      Heriz,  Yasiz, Zlakas, Nilasz,  Skzik,  Grziz, Slakiz, Klazaz
guard_list = { 162123, 162124, 162125, 162126, 162127, 162128, 162129, 162130 }

local instance_id = nil;

function event_spawn(e) 
	instance_id = eq.get_zone_instance_id();
	
	-- depop and deactivate Ssraeshzian Blood Golem on pop
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(162515) then
		eq.set_timer('depop_golem', 500);
	end
	eq.unique_spawn(162504,0,0,1000,-325,421,196);  -- Spawns Emp

	eq.delete_global(instance_id .. "_Emp_Cycle");	--reset Emp cycle qglobals
	
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
		eq.get_entity_list():GetSpawnByID(368757):Disable();	--Disable Fake Blood spawnpoint
	end
end

function event_death_complete(e)
	eq.stop_timer('aggro_guards');
	-- activate emp
	eq.signal(162504, 99);
	-- enable fake blood spawn point
	local fbs = eq.get_entity_list():GetSpawnByID(368757);	--Fake Blood Spawnpoint
	fbs:Enable();
	fbs:Reset();
	
	eq.set_global(instance_id .. "_Emp_Cycle", "1",3,"D8");	--sets Qglobal to indicate Blood killed so emp will respawn on server reset
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
