-- Zone: PoTactics    ID: 214113 -- --Rallos_Zek_the_Warlord

--This is a list of the spawn2 id's of all mobs that spawn in the pit.
--There are mobs that do not spawn in the pit, that path into it.
--They are not disabled from spawning.
local spawn2list = {44462,44639,44640,44641,44642,44646,44654,44655,44656,44657,44664,44665,44666,44667,44674,44675,44676,44677,44678,44679,44681,44682,44687,44688,44702,44703,44705,44708,44709,44710,44711,44712,44713,44715,44716,44719,44720,44721,44722,44723,44724,44727,44728,44729,44737,44738,44742,44743,44744,44745,44746,44747,44748,44749,44758,44759,44760,44761,44762,44763,44764,44765,44775,44776,44780,44781,44782,44680};

function event_spawn(e)
	eq.set_timer("fail",60 * 60 * 1000);   -- 1 hour to kill him
	for _,spawn2 in pairs(spawn2list) do   -- Depsawn all the mobs in the pit
		--disable the spawn2 entry for all the pit mobs.
		eq.disable_spawn2(spawn2);
		--used for testing, you can uncomment this to make them all respawn in 10 seconds after spawning rallos
		--eq.updatespawntimer($spawn2,10000); --set it all to 10 second respawn
	end
	-- disable piglet from spawning and starting the stampede
	eq.disable_spawn2(157400);
end

function event_combat(e)
	if e.joined then
		eq.set_timer("adds", 60 * 1000);
	end
end

function event_death_complete(e)
	eq.spawn2(214105,0,0,699,8,-294,64);   -- spawn a_planar_projection
	eq.stop_timer("fail");
	eq.stop_timer("adds");
	eq.signal(214123, 214113);         -- let the trigger know RZtW died
	eq.depop_all(214114);
	for _,spawn2 in pairs(spawn2list) do  -- Respawn mobs in pit
		-- Set pit mobs to respawn in 30 minutes. comment this line out to not set the 30 minute timer for testing.
		eq.update_spawn_timer(spawn2,1800000);
		--re-enable the spawn2 entry for all the pit mobs.
		eq.enable_spawn2(spawn2);
	end
	--set the piglet's respawn to 30 minutes.
	eq.update_spawn_timer(157400,1800000);
	--re-enable the spawn2 entry for piglet
	eq.enable_spawn2(157400);
end

function event_timer(e)
	if(e.timer == "fail") then
		eq.stop_timer(e.timer);
		eq.stop_timer("adds");
		eq.depop_all(214114);
		eq.depop();
	elseif(e.timer == "adds") then
		if(e.self:IsEngaged()) then
			eq.spawn2(214114,0,0,565,-95,-293,66);
			eq.spawn2(214114,0,0,815,-100,-293,255);
			eq.spawn2(214114,0,0,815,-295,-293,68);
			eq.spawn2(214114,0,0,565,185,-293,0);
			local npc_list = eq.get_entity_list():GetNPCList();
			for npc in npc_list.entries do
				if(npc:GetNPCTypeID() == 214114) then
					npc:AddToHateList(e.self:GetHateRandom(), 1);
				end
			end
		else
			eq.depop_all(214114);   -- Depop the adds since RZ is not currently agroed.
			eq.stop_timer(e.timer);
		end
	end
end

-- End of file   Zone: PoTactics    ID: 214113 -- --Rallos_Zek_the_Warlord 