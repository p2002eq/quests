----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Stoning
-- Zone: Plane of Justice
-- NPC: #Event_Stoning_Control (201505)
--
-- Event NPCS:
-- #a_relentless_punisher (201477)
-- #a_shadow_grinder (201507)
-- #a_ruthless_grinder (201478)
-- #nemesis_of_stone (201492)
-- #an_accused_prisoner (201486)
-- #a_pitiless_avenger (201506)
-- #Yurae_Zhaleem (201508)

-- The Tribunal (201449)
----------------------------------------------------------------------
local trial_wave     = 0;
local mobs_killed		= 0;

-- Time from when the 1st mob in a wave is killed till 
-- the next wave spawns; ~90 seconds
local first_wave     = 20000;
local next_wave		= 90000;

local trial_mobs		= {201477, 201507, 201478, 201492, 201486, 201506, 201508 };

local wave_ids			= { };

function event_spawn(e)
	spawn_prisoners();
	eq.signal(201075,5); 	--signal Agent_of_The_Tribunal (201075) to lock event
	-- Mobs should spawn ~20sec after the Event starts
	eq.set_timer("next_wave", first_wave);

	trial_wave	= 0;
	mobs_killed = 0;
	wave_ids		= { };

end

function event_signal(e)
	if (e.signal == 1) then -- Win Condition
		eq.stop_all_timers();
		eq.signal(201449,1); -- Stoning Tribunal
		eq.signal(201075,15); 	--signal Agent_of_The_Tribunal (201075) to unlock event
		despawn_prisoners();
		eq.depop();
	elseif (e.signal == 2) then -- Fail Condition
		eq.stop_all_timers();
		despawn_prisoners();
		eq.signal(201449, 2); -- Stoning Tribunal
		eq.signal(201075,15); 	--signal Agent_of_The_Tribunal (201075) to unlock event
		eq.depop();
	elseif (e.signal == 9) then	--signal on mob deaths (only applies to 4th wave prior to boss)
		local npc;
		local despawn_archers = 1;

		mobs_killed = mobs_killed + 1;
		eq.zone_emote(14,"Mobs killed: [" .. mobs_killed .. "]");

		for k,v in pairs(wave_ids) do
			npc = eq.get_entity_list():GetNPCByID(v);
			if (npc.valid) then
				despawn_archers = 0;
			end
		end

		if ( despawn_archers == 1 ) then
			eq.depop_all( 201506 );
		end

		if ( mobs_killed == 16 ) then 
			eq.spawn2(201508, 0,0, -122, -1134, 74, 508);	-- #Yurae_Zhaleem (201508)
		end
	end
end

function event_timer(e)

   if (e.timer == "next_wave") then
      eq.stop_timer(e.timer);

      trial_wave = trial_wave + 1;
      spawn_mobs(trial_wave);

		if ( trial_wave < 4 ) then
			eq.set_timer("next_wave", next_wave);
		end
	end
end

function spawn_mobs(wave)

	local index = table.getn(wave_ids);
	local npc;
	
	-- Spawn Archers
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(201506) == false ) then
		eq.spawn2( 201506, 0, 0, -177, -1188, 73, 2);
		eq.spawn2( 201506, 0, 0,  -82, -1188, 73, 2);
	end

   if (wave < 5) then
		--
		-- Spawn 4 random mobs in 3 random cubbies
		for i = 1, 4, 1 do
			local spawn_at = eq.ChooseRandom( 1, 2, 3 );
			local rand = math.random(1,100);
			if rand <= 10 then
				npc_id = eq.ChooseRandom(201492,201478);	--#nemesis_of_stone (201492) and #a_ruthless_grinder (201478)
			else
				npc_id = eq.ChooseRandom(201477,201507);	-- #a_relentless_punisher (201477) or #a_shadow_grinder (201507)
			end
			
			if (spawn_at == 1) then
				npc = eq.spawn2(npc_id, 52, 0, -130, -1233, 73, 0);
			elseif (spawn_at == 2) then
				npc = eq.spawn2(npc_id, 53, 0, -241, -1120, 73, 128);
			elseif (spawn_at == 3) then
				npc = eq.spawn2(npc_id, 54, 0, -21,  -1121, 73, 380);
			end
			if (npc.valid) then 
				wave_ids[index + i] = npc:GetID();
			end
		end
   end
end

function spawn_prisoners()
   -- an accused prisoner
   eq.spawn2(201486, 0, 0, -88, -1046, 73, 250);
   eq.spawn2(201486, 0, 0, -129, -1046, 73, 250);
   eq.spawn2(201486, 0, 0, -171, -1046, 73, 250);
end

function despawn_prisoners() 
   local prisoners = { 201486, 201506 };	--prisoners and archers
   for k,v in pairs(prisoners) do
      eq.depop_all(v);
   end
end

function despawn_mobs()
   for k,v in pairs(trial_mobs) do
      eq.depop_all(v);
   end
end


