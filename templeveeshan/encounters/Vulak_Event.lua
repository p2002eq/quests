-- Vulak ring event in NTOV
-- By Taian and Kalaylus

-- please add summon dragon NPCIDs to dragons table and any mobs used in the event to the event_mobs table
local dragons = { 124010, 124008, 124074, 124076, 124077, 124103, 124289};
local event_mobs = { 124314, 124326, 124318, 124319, 124320, 124321, 124329, 124322, 124323, 124316, 124081, 124059, 124317, 124324, 124328, 124315, 124325, 124312 };

function event_encounter_load(e)
	wave = 0;
	carrion = false;
	unload = false;
	
	-- start event in 1 minute
	wave_timer = 540000;
	eq.set_timer("start", 60000); -- timer to start wave 1
	
	-- triggers for carrion drake spawns and splitters
	eq.register_player_event("Vulak_Event", Event.death, CarrionCheck);
	eq.register_npc_event("Vulak_Event", Event.death, -1, SplitterCheck);
	
	-- triggers on spawn of Vulak
	eq.register_npc_event("Vulak_Event", Event.spawn, 124323, DragonCall);
	
	-- triggers for event end/reset
	eq.register_npc_event("Vulak_Event", Event.death_complete, 124323, Cleanup);
	eq.register_npc_event("Vulak_Event", Event.spawn, 124000, Cleanup);
	
	-- triggers for heals upon death of minibosses
	eq.register_npc_event("Vulak_Event", Event.death_complete, 124316, BossHeal);
	eq.register_npc_event("Vulak_Event", Event.death_complete, 124318, BossHeal);
	eq.register_npc_event("Vulak_Event", Event.death_complete, 124321, BossHeal);
	eq.register_npc_event("Vulak_Event", Event.death_complete, 124322, BossHeal);
	
	-- GM control of event
	eq.register_player_event("Vulak_Event", Event.say, GMControl);
end

function event_timer(e)
	if e.timer == "hb" then
		if old_timer ~= wave_timer then -- the only reason this is necessary is I can't seem to figure out how to set event timers from inside the GMControl function!
			eq.stop_timer("waves");
			eq.set_timer("waves", wave_timer);
			old_timer = wave_timer;
		elseif unload then -- putting event unloading on a separate trigger since it seems to be clobbering execution of lines before it
			eq.stop_timer(e.timer);
			eq.unload_encounter("Vulak_Event");
		end
	elseif e.timer == "start" then
		eq.stop_timer(e.timer);
		old_timer = wave_timer;
		wave = 1;
		
		eq.spawn2(124325,0,0,-710,940,121.5,122);	-- spawn dt destroyers
		eq.spawn2(124325,0,0,-740,940,121.5,122);
		eq.spawn2(124325,0,0,-770,940,121.5,122);

		-- wave 1 spawns (wurm + 2 drakes + hatchlings)
		spawn_mob(124081, 4);
		spawn_mob(124059, 2);
		spawn_mob(124059, 3);
		spawn_hatchlings();	-- random hatchlings
		carrion = false;
		
		eq.set_timer("waves", wave_timer); -- timer for future waves
		eq.set_timer("playercheck", 30000); -- checks for players every 30 seconds
		eq.set_timer("hb", 1000); -- heartbeat timer
		
	elseif e.timer == "waves" then
		if wave == 1 then
			wave = 2;
			
			-- wave 2 spawns (flurry + hatchlings) # carrion active
			spawn_mob(124314, 1);
			spawn_hatchlings();
			carrion = true;
			
		elseif wave == 2 then
			wave = 3;
			
			-- wave 3 spawns (2 wurms + 2 drakes + hatchlings) 
			spawn_mob(124081, 4);
			spawn_mob(124081, 4);
			spawn_mob(124059, 2);
			spawn_mob(124059, 3);
			spawn_hatchlings();
			carrion = false;
			
		elseif wave == 3 then
			wave = 4;
			
			-- wave 4 spawns (Zruk the Lifestealer) # carrion active
			spawn_mob(124316, 4);
			carrion = true;
			
		elseif wave == 4 then
			wave = 5;
			
			-- wave 5 spawns (wurm + 4 drakes + hatchlings)
			spawn_mob(124081, 4);
			spawn_mob(124059, 1);
			spawn_mob(124059, 2);
			spawn_mob(124059, 3);
			spawn_mob(124059, 5);
			spawn_hatchlings();
			carrion = false;
		
		elseif wave == 5 then
			wave = 6;
			
			-- wave 6 spawns (2x splitters @ 11 mobs each)
			spawn_mob(124326, 1);
			spawn_mob(124326, 4);
			carrion = false;
			
		elseif wave == 6 then
			wave = 7;
			
			-- wave 7 spawns (3 flurry) # carrion active
			spawn_mob(124314, 1);
			spawn_mob(124314, 2);
			spawn_mob(124314, 3);
			carrion = true;
			
		elseif wave == 7 then
			wave = 8;
			
			-- wave 8 spawns (Rathek the Tigerclaw with pet)
			spawn_mob(124318, 5);
			spawn_mob(124319, 5, true);
			carrion = false;
			
		elseif wave == 8 then
			wave = 9;
			
			-- wave 9 spawns (5 destroyers)
			for i = 1, 5 do
				spawn_mob(124320, i);
			end
			carrion = false;
			
		elseif wave == 9 then
			wave = 10;
			
			-- wave 10 spawns (2 flurry + wurm) # carrion active
			spawn_mob(124081, 4);
			spawn_mob(124314, 2);
			spawn_mob(124314, 3);
			carrion = true;
			
		elseif wave == 10 then
			wave = 11;
			
			-- wave 11 spawns (flurry + 2 destroyers) # carrion active
			spawn_mob(124314, 1);
			spawn_mob(124320, 2);
			spawn_mob(124320, 3);
			carrion = true;
			
		elseif wave == 11 then
			wave = 12;
			
			-- wave 12 spawns (Vethrol the Skycaller)
			spawn_mob(124321, 5);
			carrion = false;
			
		elseif wave == 12 then
			wave = 13;
			
			-- wave 13 spawns (3 flurry) # carrion active
			spawn_mob(124314, 1);
			spawn_mob(124314, 2);
			spawn_mob(124314, 3);
			carrion = true;
			
		elseif wave == 13 then
			wave = 14;
			
			-- wave 14 spawns (3 splitters @ 3 mobs each)
			spawn_mob(124329, 1);
			spawn_mob(124329, 2);
			spawn_mob(124329, 3);
			carrion = false;
			
		elseif wave == 14 then
			wave = 15;
			
			-- wave 15 spawns (2x splitters @ 11 mobs each)
			spawn_mob(124326, 2);
			spawn_mob(124326, 3);
			carrion = false;
			
		elseif wave == 15 then
			wave = 16;
			
			-- wave 16 spawns (The Herald of Vulak'Aerr)
			spawn_mob(124322, 5);
			carrion = false;
			
		elseif wave == 16 then
			eq.stop_timer(e.timer);
			wave = 17;
			
			-- VULAK spawns
			spawn_mob(124323, 5);
			carrion = false;
			eq.set_timer("depop", 3600000);
		end
	elseif e.timer == "playercheck" then
		if not player_check() then
			eq.stop_timer(e.timer);
			eq.set_timer("depop", 1000);
		end
	elseif e.timer == "depop" then
		eq.stop_timer(e.timer);
		eq.get_entity_list():GetSpawnByID(354475):Repop();
	end
    
end

function CarrionCheck(e)
	-- spawn carrion drake upon death of a player in specific waves
	if carrion and e.self:CalculateDistance(-739, 518, 120) <= 300 then -- 300 distance from Vulak spawn
		eq.spawn2(124315,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
	end
end

function DragonCall(e)
	e.self:Shout("Aid me my children!");

	for _, dragon in ipairs(dragons) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(dragon) then
			eq.get_entity_list():GetMobByNpcTypeID(dragon):CastToNPC():GMMove(e.self:GetX(), e.self:GetY(), e.self:GetZ());
		end
	end
end

function SplitterCheck(e)
	-- split drakes depending on type
	if e.self:GetNPCTypeID() == 124326 then
		spawn_mob(124317, math.random(5));
		spawn_mob(124317, math.random(5));
	elseif e.self:GetNPCTypeID() == 124317 then
		spawn_mob(124324, math.random(5));
		spawn_mob(124324, math.random(5));
	elseif e.self:GetNPCTypeID() == 124329 then
		spawn_mob(124324, math.random(5));
	elseif e.self:GetNPCTypeID() == 124324 then
		spawn_mob(124328, math.random(5));
	end
end

function Cleanup(e)
	-- depop event mobs and move any summoned dragons back to their spawn
	for _, mob in ipairs(event_mobs) do
		eq.depop_all(mob);
	end

	for _, dragon in ipairs(dragons) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(dragon) then
			local mob = eq.get_entity_list():GetMobByNpcTypeID(dragon);
			if (dragon == 124010) then 
				mob:CastToNPC():GMMove(-781, 208, 98.7, 130.5);
			elseif (dragon == 124008) then
				mob:CastToNPC():GMMove(-1266,-49, 90, 40.8);
			elseif (dragon == 124074) then
				mob:CastToNPC():GMMove(-1699, 197, 80, 8.1);
			elseif (dragon == 124076) then
				mob:CastToNPC():GMMove(-1643, 1622, 190, 160);
			elseif (dragon == 124077) then
				mob:CastToNPC():GMMove(-150, 974, 130, 181.5);
			elseif (dragon == 124103) then
				mob:CastToNPC():GMMove(-123, 738, 66, 36.7);
			elseif (dragon == 124289) then
				mob:CastToNPC():GMMove(-60, -285, 25, 255);
			end
		end
	end
	
	unload = true;
end

function BossHeal()
	local player_list = eq.get_entity_list():GetClientList();
	local aoeSpells = true;
	if(player_list ~= nil) then
		for player in player_list.entries do	
			if(aoeSpells and player:Class() ~= "Bard" and player:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 100) then
				player:SpellFinished(2698,player,0,0);
				player:SpellFinished(2697,player,0,0);
				aoeSpells = false;
			end
		end
	end
end

function spawn_hatchlings()
    local spawnNum = math.random(3,6);
    for i = 1, spawnNum do
		spawn_mob(124312, 5, true);
    end
end

function spawn_mob(NPCID, loc, rand)
	rand = rand or false;
	
	-- loc1 back, loc2 left, loc3 right, loc4 bridge, loc5 center
	local xloc = {-739,-810,-672,-739,-739};
	local yloc = { 445, 518, 507, 715, 518};
	local zloc = { 128, 121, 121, 123, 120};
	local hloc = {   0,   0,   0,   0,   0};
	
	if rand then
		eq.spawn2(NPCID,0,0,xloc[loc]+math.random(-45,45),yloc[loc]+math.random(-45,45),zloc[loc],hloc[loc]);
	else
		eq.spawn2(NPCID,0,0,xloc[loc],yloc[loc],zloc[loc],hloc[loc]);
	end
end

function player_check()
	-- checks for players
	local player_list = eq.get_entity_list():GetClientList();
	if(player_list ~= nil) then
		for player in player_list.entries do
			if player:CalculateDistance(-739, 518, 120) <= 300 and not player:GetFeigned() then
				return true; -- if player within 300 and not FD, return true
			end
		end
	end
	
	return false; -- if nothing checks out, returns false
end

function GMControl(e)
	if e.self:Admin() > 100 and e.self:CalculateDistance(-739, 518, 120) <= 300 then
		if(e.message:findi("help")) then
			e.self:Message(6, "To check current wave number and current wave timer, say 'status'.");
			e.self:Message(6, "To adjust the current wave count, say 'wave #' where # is the number of the wave to which you want to set the event. Note that this doesn't change the timer, but the event will continue normally from this point. i.e. setting the event to wave10 will cause wave11 to spawn at the next expiration of the timer.");
			e.self:Message(6, "To adjust the current wave timer, say 'timer #' where # is the length of each wave in seconds. This DOES reset the timer. e.g. if you say 'timer 120', the timer will be reset to 120 seconds - the next wave will spawn in 2 minutes, and a new wave will spawn every 2 minutes after that. This does not affect event reset timers.");
		elseif(e.message:findi("wave")) then
			if wave >= 1 then
				local wave_num = tonumber(string.sub(e.message, string.find(e.message, '%d+')));
				if wave_num >= 1 and wave_num < 17 then
					wave = wave_num;
					e.self:Message(6, string.format("Wave set to number %s. Wave timer currently at %s seconds.", wave_num, wave_timer/1000));
				else
					e.self:Message(6, "Wave number not valid, try again.");
				end
			else
				e.self:Message(6, "Please wait until the event starts to change waves.");
			end
		elseif(e.message:findi("timer")) then
			if wave >= 1 then
				local temp_time = tonumber(string.sub(e.message, string.find(e.message, '%d+')));
				if temp_time > 0 and temp_time < 3600 then
					wave_timer = temp_time*1000;
					e.self:Message(6, string.format("Wave timer set to %s seconds. Currently on wave %s.", wave_timer/1000, wave));
				else
					e.self:Message(6, "Timer length not valid, try again.");
				end
			else
				e.self:Message(6, "Please wait until the event starts to reset the timer.");
			end
		elseif(e.message:findi("status")) then
			e.self:Message(6, string.format("Wave timer is %s seconds. Currently on wave %s.", wave_timer/1000, wave));
		end
	end
end
