----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Torture
-- Zone: Plane of Justice
-- NPC: #Event_Torture_Control (201510)
--
-- Event NPCS:
--
-- #a_twisted_tormentor (201484)
-- #an_accursed_tormentor (201485)
-- #nemesis_of_despair (201490)
-- #nemesis_of_pain (201491)
-- #wraith_of_agony (201515)
-- #Punisher_Veshtaq (201496)

-- #a_tortured_prisoner (201483)
-- #Pain_and_Suffering (201516)
-- #relief (201517)

-- The Tribunal (201450)
----------------------------------------------------------------------

-- The trial of torture starts 20 seconds after spiging with the appropriate Tribunal
--
-- There are 4 waves of 4 mobs.
--
-- After the 1st mob from each wave (each 4 mobs to a wave are uniquely identified) the
-- next wave timer will start; 90 seconds after the 1st mob in the wave is killed the 
-- second wave will spawn.
--
-- If a Wave of Mobs is killed in less than 60 seconds then a Wraith of Agony will spawn.
--
-- When the Wraith of Agony dies all of the NPCs within the trial will be fully healed.
--
-- If a Wraith of Agon spawns and is not aggroed within 60 seconds the Trial fails.
--
-- If the first wave of mobs is not aggroed within 5minutes of reaching its final waypoint
-- the Trial fails.
--
-- A full wave need not be completely killed before the following wave spawns.
--
-- After all of the wave of mobs has been killed and all of the Wraith of Agony mobs are killed
-- the final boss will spawn.
--
local trial_wave = 0;
local boss = false;
local wraith = true;
local wraith_counter = 0;
local wraith_timer = 90000;	--90sec


local wave_timer	= 120000;	--2min
local first_wave 	= 20000;	--20sec

local trial_mobs	= { 201484, 201485, 201490, 201491, 201515, 201483, 201516, 201517  };


function event_spawn(e)
	spawn_prisoners();
	eq.signal(201075,6); 	--signal Agent_of_The_Tribunal (201075) to lock event
	-- Mobs should spawn ~20sec after the Event starts
	eq.set_timer("next_wave", first_wave);

	trial_wave = 0;
	wraith = true;
	wraith_counter = 0;
	boss = false;
end

function event_signal(e)
	if (e.signal == 1) then
		eq.signal(201075,16); 	--signal Agent_of_The_Tribunal (201075) to unlock event
		eq.signal(201450,1); -- Hanging Tribunal
		despawn_mobs();
		eq.depop();
	elseif (e.signal == 2) then
		eq.signal(201075,16); 	--signal Agent_of_The_Tribunal (201075) to unlock event
		eq.signal(201450,2); -- Hanging Tribunal
		despawn_mobs();
		eq.depop();
	elseif (e.signal == 7) then
		-- Wraith has died; stop the timer and CH all the NPCs and PCs(?) in the trial.
		wraith_counter = wraith_counter + 1;
		heal_trial();
	elseif (e.signal == 9) then
		if (trial_wave < 4) and not mob_check() and wraith then
			eq.stop_timer("wraith_check");
			wraith = false;
			spawn_wraith();			
		elseif (trial_wave == 4) and not mob_check() and not boss then
			boss = true;
			eq.set_timer("boss_timer", 1000);
		end
	end
end

function event_timer(e)		
	if (e.timer == "next_wave") then
		eq.stop_timer(e.timer);
		trial_wave = trial_wave + 1;
		spawn_mobs();
		if (trial_wave < 3) or (trial_wave < 4 and wraith_counter > 0) then
			eq.set_timer("next_wave", wave_timer);
		elseif trial_wave < 4 then
			eq.signal(201510,2);	--signal self that event has failed
		end

	elseif (e.timer == "boss_timer") then
		eq.stop_timer(e.timer);
		eq.spawn2(201496, 0, 0, 862,-1121,62,128);	-- #Punisher_Veshtaq (201496)
	elseif (e.timer == "wraith_check") then
		eq.stop_timer(e.timer);
		wraith = false;
	end
end

function spawn_wraith()
	local location = eq.ChooseRandom(1,2);
	
	if ( location == 1 ) then
		eq.spawn2(201515, 0, 0, 723, -1120, 88, 136);	--#wraith_of_agony (201515)
	else 
		eq.spawn2(201515, 0, 0, 880, -1120, 58, 384);	--#wraith_of_agony (201515)
	end
end

function spawn_mobs(wave)
	local spawn_locs = {[1] = {885,-1235,73,0}, [2] = {855,-1235,73,0}, 			--South Spawns
						[3] = {885,-1005,73, 130}, [4] = {855,-1005,73, 130} };		--North Spawns
	local grids = {	166,167,168,169};	--2 South/2 North
	
	--start wraith check timer
	wraith = true;
	eq.set_timer("wraith_check", wraith_timer); 
	
	for n = 1,4 do
		local rare = math.random(1,100);
		if (rare <= 10) then
			eq.spawn2(eq.ChooseRandom(201490,201485),grids[n],0,unpack(spawn_locs[n]));	-- #nemesis_of_despair (201490)  or #an_accursed_tormentor (201485)
		else
			eq.spawn2(eq.ChooseRandom(201484,201491),grids[n],0,unpack(spawn_locs[n]));	-- #a_twisted_tormentor (201484) or #nemesis_of_pain (201491)
		end
	end
end

function spawn_prisoners()	
	-- #a_tortured_prisoner (201483)
	eq.spawn2(201483, 0, 0, 907, -1157, 58, 444);
	eq.spawn2(201483, 0, 0, 832, -1158, 58, 62);
	eq.spawn2(201483, 0, 0, 832, -1085, 58, 180);
	eq.spawn2(201483, 0, 0, 906, -1085, 58, 312);

	-- #Pain_and_Suffering (201516)
	eq.spawn2(201516, 0,0, 912,-1161, 60, 444);
	eq.spawn2(201516, 0,0, 827,-1163, 60, 70);
	eq.spawn2(201516, 0,0, 827,-1080, 60, 180);
	eq.spawn2(201516, 0,0, 910,-1078, 60, 324);
end

function despawn_prisoners() 
	local prisoners = { 201483, 201516 }
	for k,v in pairs(prisoners) do
		eq.depop_all(v);
	end
end

function despawn_mobs()
	for k,v in pairs(trial_mobs) do
		eq.depop_all(v);
	end
end

function heal_trial()
	eq.spawn2(201517,0,0,865,-1116,58,0);	--spawn #relief
end


function mob_check()
	local mobs = {201484,201485,201490,201491,201515}; -- #a_twisted_tormentor (201484), #an_accursed_tormentor (201485), #nemesis_of_despair (201490), #nemesis_of_pain (201491), #wraith_of_agony (201515) 
	for k,v in pairs(mobs) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(v) then
			return true;
		end
	end
	return false;
end
