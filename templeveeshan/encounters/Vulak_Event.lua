-- Vulak ring event in NTOV
-- By Taian and Kalaylus

local dragons = {124008, 124074, 124076, 124077, 124103, 124289};

function event_encounter_load(e)
	-- start event in 1 minute
	wave = 0;
	eq.set_timer("start", 60000); -- timer to start wave 1
	
	eq.register_player_event("Vulak_Event", Event.death_complete, CarrionCheck);
	eq.register_npc_event("Vulak_Event", Event.death_complete, -1, SplitterCheck);
	
	eq.register_npc_event("Vulak_Event", Event.spawn, 124323, DragonCall);
	eq.register_npc_event("Vulak_Event", Event.death_complete, 124323, Cleanup);
	
	eq.register_player_event("Vulak_Event", Event.say, GMControl);
end

function GMControl(e)
	if e.self:Admin() > 100 and e.self:CalculateDistance(-739, 518, 120) <= 300 then
		if(e.message:findi("help")) then
			e.self:Message(6, "To control the event, say 'wave#' where # is the number of the wave to which you want to set the event. Note that this doesn't change the timer, but the event will continue normally from this point. i.e. setting the event to wave10 will cause wave11 to spawn at the next expiration of the timer.")
		elseif(e.message:findi("wave")) then
			local wave_num = string.match(e.message, "(%d+)")
			if wave_num >= 1 and wave_num < 17 then
				wave = wave_num;
				e.self:Message(6, "Wave set to number" .. wave_num);
			else
				e.self:Message(6, "Wave number not valid, try again.");
			end
		end
	end
end

function event_timer(e)
	if e.timer == "start" then
		eq.stop_timer(e.timer);
		wave = 1;
		
		eq.spawn2(124325,0,0,-719,1019,121.5,122);	-- spawn dt destroyers
		eq.spawn2(124325,0,0,-740,1020,121.5,122);
		eq.spawn2(124325,0,0,-760,1020,121.5,122);
		
		local npcs = {124284,124157,176010};		-- despawn guardians
		local npc_list = eq.get_entity_list():GetNPCList();
		if(npc_list ~= nil) then
			for npc in npc_list.entries do
				for i = 1, #npcs do			
					if(npc:GetNPCTypeID() == npcs[i]) then
						npc:Depop();
					end
				end
			end
		end

		-- wave 1 spawns (wurm + 2 drakes + hatchlings)
		spawn_mob(124081, 4);
		spawn_mob(124059, 2);
		spawn_mob(124059, 3);
		spawn_hatchlings();	-- random hatchlings
		
		-- eq.set_timer("waves", 540000); -- timer for future waves
		eq.set_timer("waves", 60000); -- testing timer
		eq.set_timer("playercheck", 60000); -- checks for players every minute
		
	elseif e.timer == "waves" then
		if wave == 1 then
			wave = 2;
			
			-- wave 2 spawns (flurry + hatchlings) # carrion active
			spawn_mob(124314, 1);
			spawn_hatchlings();
			
		elseif wave == 2 then
			wave = 3;
			
			-- wave 3 spawns (2 wurms + 2 drakes + hatchlings) 
			spawn_mob(124081, 4);
			spawn_mob(124081, 4);
			spawn_mob(124059, 2);
			spawn_mob(124059, 3);
			spawn_hatchlings();
			
		elseif wave == 3 then
			wave = 4;
			
			-- wave 4 spawns (Zruk the Lifestealer) # carrion active
			spawn_mob(124316, 4);
			
		elseif wave == 4 then
			wave = 5;
			
			-- wave 5 spawns (wurm + 4 drakes + hatchlings)
			spawn_mob(124081, 4);
			spawn_mob(124059, 1);
			spawn_mob(124059, 2);
			spawn_mob(124059, 3);
			spawn_mob(124059, 5);
			spawn_hatchlings();
		
		elseif wave == 5 then
			wave = 6;
			
			-- wave 6 spawns (2x splitters @ 11 mobs each)
			spawn_mob(124326, 1);
			spawn_mob(124326, 4);
			
		elseif wave == 6 then
			wave = 7;
			
			-- wave 7 spawns (3 flurry) # carrion active
			spawn_mob(124314, 1);
			spawn_mob(124314, 2);
			spawn_mob(124314, 3);
			
		elseif wave == 7 then
			wave = 8;
			
			-- wave 8 spawns (Rathek the Tigerclaw with pet)
			spawn_mob(124318, 5);
			spawn_mob(124319, 5, true);
			
		elseif wave == 8 then
			wave = 9;
			
			-- wave 9 spawns (5 destroyers)
			for i = 1, 5 do
				spawn_mob(124320, i);
			end
			
		elseif wave == 9 then
			wave = 10;
			
			-- wave 10 spawns (2 flurry + wurm) # carrion active
			spawn_mob(124081, 4);
			spawn_mob(124314, 2);
			spawn_mob(124314, 3);
			
		elseif wave == 10 then
			wave = 11;
			
			-- wave 11 spawns (flurry + 2 destroyers) # carrion active
			spawn_mob(124081, 1);
			spawn_mob(124320, 2);
			spawn_mob(124320, 3);
			
		elseif wave == 11 then
			wave = 12;
			
			-- wave 12 spawns (Vethrol the Skycaller)
			spawn_mob(124321, 5);
			
		elseif wave == 12 then
			wave = 13;
			
			-- wave 13 spawns (3 flurry) # carrion active
			spawn_mob(124314, 1);
			spawn_mob(124314, 2);
			spawn_mob(124314, 3);
			
		elseif wave == 13 then
			wave = 14;
			
			-- wave 14 spawns (3 splitters @ 3 mobs each)
			spawn_mob(124324, 1);
			spawn_mob(124324, 2);
			spawn_mob(124324, 3);
			
		elseif wave == 14 then
			wave = 15;
			
			-- wave 15 spawns (2x splitters @ 11 mobs each)
			spawn_mob(124326, 2);
			spawn_mob(124326, 3);
			
		elseif wave == 15 then
			wave = 16;
			
			-- wave 16 spawns (The Herald of Vulak'Aerr)
			spawn_mob(124322, 5);
			
		elseif wave == 16 then
			eq.stop_timer(e.timer);
			wave = 17;
			
			-- VULAK spawns
			spawn_mob(124323, 5);
			eq.set_timer("depop", 3600000);
		end
	elseif e.timer == "playercheck" then
		if not player_check() then
			eq.set_timer("depop", 1000);
		end
	elseif e.timer == "depop" then
		Cleanup();
		eq.get_entity_list():GetSpawnByID(354475):Repop();
		eq.unload_encounter("Vulak_Event");
	end
    
end

function CarrionCheck(e)
	-- spawn carrion drake upon death of a player in specific waves
	if wave == 2 or wave == 4 or wave == 7 or wave == 10 or wave == 11 or wave == 12 then
		if e.self:CalculateDistance(-739, 518, 120) <= 300 then -- 300 distance from Vulak spawn
			eq.spawn2(124315,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		end
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
	-- split drakes depending on what wave we are on
	if wave == 6 or wave == 15 then
		if e.self:GetID() == 124326 then
			spawn_mob(124317, math.random(1, 5));
			spawn_mob(124317, math.random(1, 5));
		elseif e.self:GetID() == 124317 then
			spawn_mob(124324, math.random(1, 5));
			spawn_mob(124324, math.random(1, 5));
		elseif e.self:GetID() == 124324 then
			spawn_mob(124328, math.random(1, 5));
		end
	elseif wave == 14 then
		if e.self:GetID() == 124324 then
			spawn_mob(124317, math.random(1, 5));
		elseif e.self:GetID() == 124317 then
			spawn_mob(124326, math.random(1, 5))
		end
	end
end

function spawn_hatchlings()
    local spawnNum = 4;
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

function Cleanup(success)
	-- depop vulak and move any summoned dragons back to their bind.
	for _, dragon in ipairs(dragons) do
		local mob = eq.get_entity_list():GetMobByNpcTypeID(dragon);
		if(mob) then
			if (dragon == 124010) then
				mob:CastToNPC():GMMove(-781, 208, 98.7, 130.5);
			elseif (dragon == 124008) then
				mob:CastToNPC():GMMove(-1266,-49, 90, 40.8);
			elseif (dragon == 124011) then
				mob:CastToNPC():GMMove(-1362, 218, 134, 220);
			elseif (dragon == 124074) then
				mob:CastToNPC():GMMove(-1699, 197, 80, 8.1);
			elseif (dragon == 124072) then
				mob:CastToNPC():GMMove(-1760, 1604, 190, 73.4);
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
	eq.depop(124323);
	eq.depop_all(124325);
end