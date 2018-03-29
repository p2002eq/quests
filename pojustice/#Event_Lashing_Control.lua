----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Lashing
-- Zone: Plane of Justice
-- NPC: #Event_Lashing_Control (201462)
--
-- Event NPCS:
-- #a_tormented_prisoner (201455)
-- #a_harrowing_lasher (201463)  --rare spawn
-- #a_malevolent_punisher (201456)
-- #a_savage_lasher (201457)
-- #a_stinging_nemesis (201460)  --rare spawn
-- #A_Scourge_of_Honor (201458)
-- #a_flickering_spirit (201459)
-- #Lashman_Azakal (201461)
--
-- The Tribunal (201453)
----------------------------------------------------------------------
local trial_wave      = 0;
-- Time from when the 1st mob in a wave is killed till 
-- the next wave spawns; ~90 seconds
local wave_timer      = 90000; -- 90 sec
local first_wave      = 20000; -- 20 Sec
local trial_mobs	= { 201460, 201455, 201463, 201456, 201457, 201458, 201461, 201459 }; -- All mobs used in event
local wave_mobs	= { 201463, 201456, 201457, 201460 }; -- possible mobs in wave

function event_spawn(e)
   spawn_prisoners();
   -- Mobs should spawn ~20sec after the Event starts
   eq.set_timer("next_wave", first_wave);
   trial_wave = 0;
   eq.signal(201075,4); 	--signal Agent_of_The_Tribunal (201075) to lock event
end

function event_signal(e)
	if (e.signal == 1) then -- Win Condition
		--eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Success!");
		eq.signal(201453, 1); -- Lashing Tribunal
		eq.signal(201075,14); 	--signal Agent_of_The_Tribunal (201075) to unlock event
		despawn_mobs();
		eq.depop();
	elseif (e.signal == 2) then -- Fail Condition
		despawn_prisoners();
		eq.signal(201453, 2); -- Lashing Tribunal
		eq.signal(201075,14); 	--signal Agent_of_The_Tribunal (201075) to unlock event
		-- Depop the Scourge of Honor as they are immune to damage and despawned
		-- by the controller we are about to depop.
		eq.depop_all(201458); -- #A_Scourge_of_Honor
		eq.depop();
	elseif (e.signal == 9) then
		-- A Flickering Spirit has died; if all three are dead
		-- despawn a scourge of honor
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(201459) == false ) then
			eq.depop_all( 201458 ); -- #A_Scourge_of_Honor
			despawn_spirits();
			if (trial_wave < 4) then 
				eq.set_timer("next_wave", wave_timer); --90 seconds 
			elseif(trial_wave == 4) then
				eq.set_timer("next_wave", 1000); -- 1 Sec
			end
		end
	end
end

function event_timer(e)
   if (e.timer == "next_wave") then
      eq.stop_timer(e.timer);
      trial_wave = trial_wave + 1;
      spawn_mobs(trial_wave);
   elseif (e.timer == "spirit_timer") then
      eq.stop_timer(e.timer);
      spawn_spirits();
   end
end

function spawn_spirits()
   eq.spawn2( 201459, 0, 0, 1298, -1169, -13, 126 ); -- #a_flickering_spirit
   eq.spawn2( 201459, 0, 0, 1153, -1119,  88, 126 ); -- #a_flickering_spirit
   eq.spawn2( 201459, 0, 0, 1298, -1072, -13, 126 ); -- #a_flickering_spirit
   scourge = eq.spawn2( 201458, 0, 0, 1325, -1120, 2, 124); -- #A_Scourge_of_Honor
   scourge:SetRunning(true);
   scourge:CastToNPC():MoveTo(1355,-1120,2,62,true);
end

function spawn_mobs(wave)
   if (wave < 5) then
   		local spawn_locs = {[1] = {1395, -1169, 8, 64}, [2] = {1378, -1169, 8, 64}, [3] = {1395, -1070, 8, 64}, [4] = {1378, -1070, 8, 64} };
		for n = 1,4 do 
			local rare = math.random(1,100);
			if rare < 10 then
				eq.spawn2(eq.ChooseRandom(201463, 201460), 0, 0, unpack(spawn_locs[n]));	--#a_harrowing_lasher (201463) or #a_stinging_nemesis (201460)
			else
				eq.spawn2(eq.ChooseRandom(201456, 201457), 0, 0, unpack(spawn_locs[n]));	--#a_malevolent_punisher (201456) or #a_savage_lasher (201457)
			end
		end
		eq.set_timer("spirit_timer", 30000); -- 30 sec
   elseif (wave == 5) then
      -- Spawn the boss
      eq.spawn2(201461, 0,0, 1350, -1127, 2, 124); -- #Lashman_Azakal
   end
end

function spawn_prisoners()
   -- a tortured prisoner
   eq.spawn2(201455, 0, 0, 1415, -1168, 3, 392); -- #a_tormented_prisoner
   eq.spawn2(201455, 0, 0, 1415, -1120, 3, 392); -- #a_tormented_prisoner
   eq.spawn2(201455, 0, 0, 1415, -1072, 3, 392); -- #a_tormented_prisoner
end

function despawn_prisoners() 
   local prisoners = { 201455 } -- #a_tormented_prisoner
   for k,v in pairs(prisoners) do
      eq.depop_all(v);
   end
end

function despawn_spirits()
   local spirits = { 201459 } -- #a_flickering_spirit
   for k,v in pairs(spirits) do
      eq.depop_all(v);
   end
end

function despawn_mobs()
   for k,v in pairs(trial_mobs) do
      eq.depop_all(v);
   end
end
