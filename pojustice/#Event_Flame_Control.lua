----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Flame
-- Zone: Plane of Justice
-- NPC: #Event_Execution_Control (201502)
--
-- Event NPCS:
-- #spirit_of_flame (201497)
-- #fiend_of_flame (201488)
-- #a_fiery_aggressor (201473)
-- #Punisher_of_Flame (201495)
-- #Punisher_of_Flame_ (201504)  (casts AE spells)
-- #a_burning_nemesis (201503)

-- The Tribunal (201452)
----------------------------------------------------------------------
local trial_wave      = 0;
-- Time from when the 1st mob in a wave is killed till 
-- the next wave spawns; ~90 seconds
local wave_timer      = 90000; -- 90 sec
local first_wave      = 20000; -- 20 Sec
local trial_mobs	= { 201497, 201488, 201473, 201503, 201495, 201504 }; -- All mobs used in event
local wave_mobs	= { 201497, 201488, 201473, 201503 }; -- possible mobs in wave
local boss_trigger = false;


function event_spawn(e)
   -- Mobs should spawn ~20sec after the Event starts
   eq.set_timer("next_wave", first_wave);
   eq.spawn2(201504, 0, 0, 880,-729,55,127); --#Punisher_of_Flame_ (201504)
   eq.signal(201504,0,30 * 1000);	--sends signal in 30 seconds to #Punisher_of_Flame_ (201504)  (casts AE spells)
   trial_wave = 0;
   boss_trigger = false;
   eq.signal(201075,2); 	--signal Agent_of_The_Tribunal (201075) to lock event
end

function event_signal(e)
	if (e.signal == 1) then -- Win Condition
		eq.stop_all_timers();
		eq.signal(201452,1); -- Flame Tribunal
		eq.signal(201075,12); 	--signal Agent_of_The_Tribunal (201075) to unlock event
		despawn_mobs();
		eq.depop();
	elseif (e.signal == 2) then -- Fail Condition
		eq.stop_all_timers();
		despawn_mobs();
		eq.signal(201452, 2); -- Flame Tribunal
		eq.signal(201075,12); 	--signal Agent_of_The_Tribunal (201075) to unlock event
		eq.depop();
	elseif (e.signal == 9) then	--signal on mob deaths (only applies to 4th wave prior to boss)
		if(not mob_check()) and (trial_wave == 4) and (not boss_trigger) then
			boss_trigger = true;
			eq.set_timer("next_wave", 1000); -- 1 Sec
		end
	end
end

function event_timer(e)
	if (e.timer == "next_wave") then
		eq.stop_timer(e.timer);
		if (trial_wave < 4) then
			eq.set_timer("next_wave", 90000); -- 90 Sec
		end
		trial_wave = trial_wave + 1;
		spawn_mobs(trial_wave);
		boss_trigger = false;
	end
end

function spawn_mobs(wave)
	if (wave < 5) then
		--spawn trash
		local spawn_locs = {[1] = {828,-678,57,96}, [2] = {828,-783,57,31}, [3] = {932,-783,57,224}, [4] = {932,-678,57,160} };
		for n = 1,4 do 
			local rare = math.random(1,100);
			if rare < 10 then
				mob = eq.spawn2(eq.ChooseRandom(201473,201503), 0, 0, unpack(spawn_locs[n]));	--#a_fiery_aggressor (201473) or #a_burning_nemesis (201503)
			else
				mob = eq.spawn2(eq.ChooseRandom(201497,201488), 0, 0, unpack(spawn_locs[n]));	--#spirit_of_flame (201497) or #fiend_of_flame (201488)
			end
		end
	elseif (wave == 5) then
		-- Spawn the boss
		eq.spawn2(201495,0,0,881,-710,58,127); -- #Punisher_of_Flame (201495)
	end
end

function despawn_mobs()
   for k,v in pairs(trial_mobs) do
      eq.depop_all(v);
   end
end

function mob_check()
	for k,v in pairs(wave_mobs) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(v) then
			return true;	--trash mob still up
		end
	end
	return false;	--no trash mobs up
end