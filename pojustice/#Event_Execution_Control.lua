----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Execution
-- Zone: Plane of Justice
-- NPC: #Event_Execution_Control (201471)
--
-- Event NPCS:
-- #a_fierce_nemesis (201464)
-- #a_dark_nemesis (201465)
-- #herald_of_destruction (201466)
-- #priest_of_doom (201467)
-- #a_sentenced_prisoner (201468)
-- #an_executioner (201469)
-- #Prime_Executioner_Vathoch (201470)
--
-- The Tribunal (201454)
----------------------------------------------------------------------
local trial_wave      = 0;
-- Time from when the 1st mob in a wave is killed till 
-- the next wave spawns; ~90 seconds
local wave_timer      = 90000; -- 90 sec
local first_wave      = 20000; -- 20 Sec
local trial_mobs	= { 201464, 201465, 201466, 201467, 201468, 201469, 201470 }; -- All mobs used in event
local wave_mobs	= { 201464, 201465, 201466, 201467 }; -- possible mobs in wave

function event_spawn(e)
   eq.spawn2(201468,0,0,172,-1167,83,0)	--#a_sentenced_prisoner (201468)
   -- Mobs should spawn ~20sec after the Event starts
   eq.set_timer("next_wave", first_wave);
   trial_wave = 0;
   eq.signal(201075,1); 	--signal Agent_of_The_Tribunal (201075) to lock event
end

function event_signal(e)
	if (e.signal == 1) then -- Win Condition
		eq.signal(201454,1); -- Execution Tribunal
		eq.signal(201075,11); 	--signal Agent_of_The_Tribunal (201075) to unlock event
		despawn_mobs();
		eq.depop();
	elseif (e.signal == 2) then -- Fail Condition
		eq.depop_all(201468);	--should only trigger if player check is failed since other failure is triggered upon the prisoner's death
		eq.signal(201454, 2); -- Execution Tribunal
		eq.signal(201075,11); 	--signal Agent_of_The_Tribunal (201075) to unlock event
		eq.depop_all(201469); --#an_executioner (201469)
		despawn_mobs();
		eq.depop();
	elseif (e.signal == 9) then	--signal from #an_executioner (201469) when wave is clear
		if (trial_wave < 4) then 
			eq.set_timer("next_wave", 90000); -- 90 Sec
		elseif(trial_wave == 4) then
			eq.set_timer("next_wave", 1000); -- 1 Sec
		end
	end
end

function event_timer(e)
   if (e.timer == "next_wave") then
      eq.stop_timer(e.timer);
      trial_wave = trial_wave + 1;
      spawn_mobs(trial_wave);
   end
end

function spawn_mobs(wave)
	if (wave < 5) then
		--spawn executioner
		eq.spawn2(201469,0,0,266,-1045,75,384);	--#an_executioner (201469)
		eq.signal(201469,wave,200);	--send wave count
		--spawn trash
		local spawn_locs = {[1] = {166,-1092,76,127}, [2] = {166,-1071,76,127}, [3] = {223,-1092,76,127}, [4] = {223,-1071,76,127} };
		for n = 1,4 do 
			local rare = math.random(1,100);
			if rare < 10 then
				eq.spawn2(eq.ChooseRandom(201466, 201467), 0, 0, unpack(spawn_locs[n]));	--#herald_of_destruction (201466) or #priest_of_doom (201467)
			else
				eq.spawn2(eq.ChooseRandom(201464, 201465), 0, 0, unpack(spawn_locs[n]));	--#a_fierce_nemesis (201464) or #a_dark_nemesis (201465)
			end
		end
	elseif (wave == 5) then
		-- Spawn the boss
		eq.spawn2(201470, 0, 0, 198, -1158, 85, 0); -- #Prime_Executioner_Vathoch (201470)
	end
end

function despawn_mobs()
   for k,v in pairs(trial_mobs) do
      eq.depop_all(v);
   end
end
