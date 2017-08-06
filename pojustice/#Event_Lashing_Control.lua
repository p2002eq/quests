----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Lashing
-- Zone: Plane of Justice
-- NPC: #Event_Lashing_Control (201462)
--
-- Event NPCS:
-- #a_tormented_prisoner (201455)
-- #a_harrowing_lasher (201463)
-- #a_malevolent_punisher (201456)
-- #a_savage_lasher (201457)
-- #a_stinging_nemesis (201460)
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
local trial_mobs	= { 201460, 201455, 201463, 201465, 201457, 201458, 201461, 201459 }; -- All mobs used in event
local wave_mobs	= { 201463, 201456, 201457, 201460 }; -- possible mobs in wave

function event_spawn(e)
   spawn_prisoners();
   -- Mobs should spawn ~20sec after the Event starts
   eq.set_timer("next_wave", first_wave);
   trial_wave = 0;
end

function event_signal(e)
   if (e.signal == 1) then -- Win Condition
      eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Success!");
      eq.signal(201453, 1); -- Lashing Tribunal
      despawn_mobs();
      eq.depop();
   elseif (e.signal == 2) then -- Fail Condition
      eq.get_entity_list():MessageClose(e.self, false, 120, 3, "An unnatural silence falls around you.  The justice of the Tribunal has been pronounced once again.  The defendants have been found... lacking.");
      despawn_prisoners();
      eq.signal(201453, 2); -- Lashing Tribunal
		-- Depop the Scourge of Honor as they are immune to damage and despawned
		-- by the controller we are about to depop.
		eq.depop_all(201467);
      eq.depop();
   elseif (e.signal == 9) then
      -- A Flickering Spirit has died; if all three are dead
      -- despawn a scourge of honor
      if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(201469) == false ) then
         eq.depop_all( 201458 );
         if (trial_wave < 4) then 
            eq.set_timer("next_wave", 60000);
         elseif(trial_wave == 4) then
            eq.set_timer("next_wave", 1000);
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
   eq.spawn2( 201459, 0, 0, 1298, -1169, -13, 63 ); -- #a_flickering_spirit
   eq.spawn2( 201459, 0, 0, 1153, -1119,  88, 63 ); -- #a_flickering_spirit
   eq.spawn2( 201459, 0, 0, 1298, -1072, -13, 63 ); -- #a_flickering_spirit
   eq.spawn2( 201458, 0, 0, 1350, -1127, 2, 62); -- #A_Scourge_of_Honor
end

function spawn_mobs(wave)
   if (wave < 5) then
      eq.spawn2( eq.ChooseRandom( 201463, 201456, 201457, 201460 ), 0, 0, 1395, -1169, 1, 64 );
      eq.spawn2( eq.ChooseRandom( 201463, 201456, 201457, 201460 ), 0, 0, 1378, -1169, 1, 64 );
      eq.spawn2( eq.ChooseRandom( 201463, 201456, 201457, 201460 ), 0, 0, 1395, -1070, 1, 64 );
      eq.spawn2( eq.ChooseRandom( 201463, 201456, 201457, 201460 ), 0, 0, 1378, -1070, 1, 64 );
      eq.set_timer("spirit_timer", 30000); -- 30 sec
   elseif (wave == 5) then
      -- Spawn the boss
      eq.spawn2(201461, 0,0, 1350, -1127, 2, 62); -- #Lashman_Azakal
   end
end

function spawn_prisoners()
   -- a tortured prisoner
   eq.spawn2(201455, 0, 0, 1417, -1168, 1, 196); -- #a_tormented_prisoner
   eq.spawn2(201455, 0, 0, 1417, -1120, 1, 196); -- #a_tormented_prisoner
   eq.spawn2(201455, 0, 0, 1417, -1072, 1, 196); -- #a_tormented_prisoner
end

function despawn_prisoners() 
   local prisoners = { 201455 }
   for k,v in pairs(prisoners) do
      eq.depop_all(v);
   end
end

function despawn_mobs()
   for k,v in pairs(trial_mobs) do
      eq.depop_all(v);
   end
end