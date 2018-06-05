----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Hanging
-- Zone: Plane of Justice
-- NPC: #Event_Hanging_Control (201509)
--
-- Event NPCS:
-- #a_stifling_nemesis (201480)
-- #a_breathless_void (201514)
-- #a_smothering_nemesis (201481)
-- #a_timeless_void (201482)
-- #spirit_of_suffocation (201498)
-- #phantom_of_asphyxiation (201493)

-- #a_sentenced_prisoner (201511)
-- #a_sentenced_prisoner (201512)
-- #a_sentenced_prisoner (201513)
-- #Gallows_Master_Teion (201489)

-- The Tribunal (201451)
----------------------------------------------------------------------

local trial_mobs = {201480, 201514, 201481, 201482, 201498, 201493, 201511, 201512, 201513, 201489 };

local prisoners_list			= {201511,201512,201513};
local spirits_killed			= 0;
local last_steps				= 0;
local prisoner					= 0;


function event_spawn(e)
	eq.signal(201075,3); 	--signal Agent_of_The_Tribunal (201075) to lock event
	spawn_prisoners();

	-- Mobs should spawn ~20 seconds after Event Starts
	eq.set_timer("next_wave", 20000);

	spirits_killed				= 0;
	prisoner					= 0;
end

function event_signal(e)	
	if (e.signal == 1) then -- Win Condition
		eq.stop_all_timers();
		eq.signal(201451,1); -- Hanging Tribunal
		eq.signal(201075,13); 	--signal Agent_of_The_Tribunal (201075) to unlock event
		depop_prisoners();
		eq.depop();
	elseif (e.signal == 2) then -- Fail Condition
		eq.stop_all_timers();
		depop_prisoners();
		despawn_mobs();
		eq.signal(201451, 2); -- Hanging Tribunal
		eq.signal(201075,13); 	--signal Agent_of_The_Tribunal (201075) to unlock event
		eq.depop();
	elseif (e.signal == 9) then
		eq.signal(prisoners_list[prisoner],5);
		prisoner = nil;
		
		-- -- Keep track of the number of Spirits we've killed.
		-- -- Once we've killed 8 spirits; spawn the boss.
		-- -- Every 2 spirits; Spawn the next wave of mobs.
		spirits_killed = spirits_killed + 1;
		if ( spirits_killed >= 8 ) then
			spawn_boss();
		elseif ( spirits_killed % 2 == 0 ) then 
			eq.set_timer("next_wave", 30000);
		end

	end
end

function event_timer(e)	
	if (e.timer == "next_wave") then
		eq.stop_timer(e.timer);
		spawn_mobs();
		spawn_spirit();	
		
		-- Spawn the 2nd Spirit 45 seconds after the Wave begins
		eq.set_timer("next_spirit", 45000);
	elseif (e.timer == "next_spirit" ) then
		eq.stop_timer(e.timer);
		spawn_spirit();
	end
end

function spawn_spirit(spirit_id)
	-- Randomize which of the 3 steps the spirit spawns at.
	local xlocs = {540,490,440};

	-- Choose Steps/Prisoner
	prisoner = eq.ChooseRandom(1,2,3);
	
	-- But don't spawn the Spirit in front of the same Prisoner twice.
	while ( prisoner == last_steps ) do
		prisoner = eq.ChooseRandom(1,2,3);
	end

	-- Spawn the Mob
	local rare = math.random(1,100);
	if rare <= 10 then
		eq.spawn2(201493,0,0,xlocs[prisoner], -1139, 73, 250);	--#phantom_of_asphyxiation (201493) 10% spawn chance
	else
		eq.spawn2(201498,0,0,xlocs[prisoner], -1139, 73, 250);	--#spirit_of_suffocation (201498)
	end
	eq.signal(prisoners_list[prisoner],1);	--signal chosen prisoner
	last_steps = prisoner;
end

function spawn_mobs()
	local spawn_locs = {[1] = {440, -1093, 73, 124}, [2] = {536, -1093, 73, 124}}
	for n = 1,2 do
		local rare = math.random(1,100);
		if rare <= 10 then
			eq.spawn2( 201481,0,0,unpack(spawn_locs[n]));	-- #a_smothering_nemesis (201481) 
		else 
			eq.spawn2( eq.ChooseRandom(201480,201514,201482),0,0,unpack(spawn_locs[n]));	-- #a_stifling_nemesis (201480) or #a_breathless_void (201514) or #a_timeless_void (201482)
		end
	end
end

function spawn_boss()
	eq.spawn2(201489, 0, 0, 488, -1068, 73, 250);		--#Gallows_Master_Teion (201489)
end

function spawn_prisoners()
	-- Spawn the 3 prisoners by the hangmen's noose	
	eq.spawn2( 201511, 0, 0, 540, -1175, 80, 510);	--Barbarian Male
	eq.spawn2( 201512, 0, 0, 490, -1175, 80, 510);	--Wood elf Female
	eq.spawn2( 201513, 0, 0, 440, -1175, 80, 510);	--Aviak
end

function depop_prisoners()
	for k,v in pairs(prisoners_list) do
		eq.depop_all(v);
	end
end

function despawn_mobs()
   for k,v in pairs(trial_mobs) do
      eq.depop_all(v);
   end
end


