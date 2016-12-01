-- RINGWAR
-- TODO facing for move_to functions
-- TODO generalize dwarf spawn groups
-- TODO Hero walks

local ThreadManager = require("thread_manager");

-- static paths for giants
local PathInfo = {};
-- Recruit, Captain, Warrior, Priest of Zek, General, Veteran, High Priest of Zek, Warlord
local Giants = { 118340, 118338, 118344, 118346, 118339, 118342, 118335, 118343 };
-- Soldier, Cleric, Axeman
local Dwarves = { 118350, 118349, 118348 };
-- Aldikar, Dobbin, Garadain, Churn, Corbin ## NOTE THAT KARGIN IS A STATIC
local Heroes = { 118351, 118332, 118334, 118329, 118331 };
-- Spearmen, Archers x2, Kargin
local Statics = { 118341, 116555, 118347, 118337 };

local Narandi = { 118345 }

-- stages: 0 is pre-war setup, 1 is first siege, 2 is second siege, 3 is third siege, 4 is Narandi
local stage = 1;

-- tracks entity specific data (e.g. which path is this giant on? What group does this dwarf belong to? What waypoint are we at?)
local entity_data = {};

function event_encounter_load(e)
	-- spawn event trigger (decision points in function)
	eq.register_npc_event("RingTen", Event.spawn, -1, AllSpawn);
	-- signal 99 is for move-only events, other signals set specific paths
	eq.register_npc_event("RingTen", Event.signal, -1, AllSignal);
	-- recalculates waypoint every time mob loses aggro - e.g. if it has been kited closer to the end of its path, it'll pick a later waypoint rathen than walk all the way back
	eq.register_npc_event("RingTen", Event.combat, -1, AllCombat);
	-- waypoint arrive sets next waypoint in entity data for the triggering entity
	eq.register_npc_event("RingTen", Event.waypoint_arrive, -1, AllWaypoint);
	
	-- triggers for the NPC coordinating the event
	eq.register_npc_event("RingTen", Event.timer, 152018, WarTimers);
	eq.register_npc_event("RingTen", Event.say, 152018, WarTriggers);
	eq.register_npc_event("RingTen", Event.death_complete, 152018, WarEnd);
	
	-- Zrelik the Scout coordination
	-- eq.register_npc_event("RingTen", Event.spawn, 118354, ScoutSpawn);
	eq.register_npc_event("RingTen", Event.say, 118354, ScoutMove);
	
	eq.zone_emote(14, 'RingTen LOADED');
	-- set up paths as soon as encounter loads
	PathInfo = load_paths();
	-- spawn static NPCs that should exist at start of war
	PopStatics();
	-- note that NPCs that require a path need to be created by a trigger (timer, say, etc)
end

function ScoutMove(e)
	local pos = { e.other:GetX(), e.other:GetY(), e.other:GetZ(), 0.5 };
	if(e.message:findi("Dobbin assist me!")) then
		call_dwarves(pos, 6);
		e.self:Say("Dobbin is on his way!");
	elseif(e.message:findi("Garadain to my side!")) then
		call_dwarves(pos, 7);
		e.self:Say("Garadain is on his way!");
	elseif(e.message:findi("Churn protect me!")) then
		call_dwarves(pos, 8);
		e.self:Say("Churn is on his way!");	
	elseif(e.message:findi("Corbin, attack!")) then
		call_dwarves(pos, 9);
		e.self:Say("Corbin is on his way!");
	elseif(e.message:findi("For the Dain, attack!")) then
		call_dwarves({ pos[1], pos[2], pos[3], pos[4] }, 6);
		call_dwarves({ pos[1] - 22.5, pos[2] + 20, pos[3], pos[4] }, 7);
		call_dwarves({ pos[1] + 22.5, pos[2] + 20, pos[3], pos[4] }, 8);
		call_dwarves({ pos[1], pos[2] - 20, pos[3], pos[4] }, 9);
		e.self:Say("The commanders are on their way!");
	end
end

function call_dwarves(position, group)
	-- grab the entity list
	local entity_list = eq.get_entity_list();
	-- aggro the zone onto whoever attacked me.
	local npc_list = entity_list:GetNPCList();
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			local status, groupID = pcall(get_group_ID, entity_data[npc:GetID()])
			if status then
				if (npc.valid and groupID == group) then
					table.insert(entity_data[npc:GetID()]['path'], position);
				end
			end
		end
	end
end

function get_group_ID(entity_entry)
	return entity_entry['groupID']
end

function PopStatics()
	local npcs = {};
	-- Giant statics
	-- west spears
	spawn_Mobs(118341, 569, -2447, -86.4, 841, -1776, -33, 194, 12, 0);
	-- east spears
	spawn_Mobs(118341, -668, -2062, -60, -775, -2347, -75, 59, 6, 0);
	-- assign static 'path'
	eq.signal(118341, 0);
	
	-- Dwarf statics
	-- Seneschal Aldikar pop - REPLACE WITH WALK TO POSITION!!!
	eq.unique_spawn(118351, 0, 0, -113, 0, 100, 128);
	-- Aldikar guards - note that these are stronger than the normal archers in the war
	spawn_Mobs(118347, -156, -34, 95, -156, -115, 95, 80, 6, 0);
	spawn_Mobs(118347, -56, -34, 95, -56, -115, 95, 160, 6, 0);
	-- assign static 'path'
	eq.signal(118347, 0);
	eq.signal(118351, 0);
	-- archers on top of towers
	spawn_Mobs(116555, -155, -1080, 70, -195, -1080, 70, 128, 3, 0);
	spawn_Mobs(116555, 120, -1080, 70, 160, -1080, 70, 128, 3, 0);
	-- archers behind Garadain's troops
	spawn_Mobs(116555, -1770, -525, 80, -1845, -525, 80, 128, 6, 0);
	-- Archers with Kargin
	spawn_Mobs(116555, 750, -1350, 35, 750, -1450, 35, 190, 12, 0);
	-- Kargin
	eq.unique_spawn(118337, 0, 0, 740, -1400, 30, 190);
	-- assign static 'path'
	eq.signal(118337, 0);
	eq.signal(116555, 0);
end

function last_fight()
	npcs = { [118345] = 1 };
	spawn_helper(npcs, 10, 1, 1, 10, 192);
end

function group6()
	-- Dobbin soliders by towers
	npcs = { [118350] = 12 };
	spawn_helper(npcs, 6, 1, 12, 15, 128);
	-- Dobbin - REPLACE WITH WALK TO POSITION!!!
	eq.unique_spawn(118332, 0, 0, -10, -1070, 25, 128);
	eq.signal(118332, 6);
end

function group7()
	-- Garadain soldiers by spire
	npcs = { [118350] = 6, [118349] = 6 };
	spawn_helper(npcs, 7, 2, 6, 15, 128);
	-- Garadain - REPLACE WITH WALK TO POSITION!!!
	eq.unique_spawn(118334, 0, 0, -1800, -570, 75, 128);
	eq.signal(118334, 7);
end

function group8()
	-- Churns troops by tizmak cave
	npcs = { [118348] = 12 };
	spawn_helper(npcs, 8, 2, 6, 15, 128);
	-- Churn - REPLACE WITH WALK TO POSITION!!!
	eq.unique_spawn(118329, 0, 0, 1600, -1030, 330, 128);
	eq.signal(118329, 8);
end

function group9()
	-- Corbin troops near wurms
	npcs = { [118350] = 6, [118349] = 6 };
	spawn_helper(npcs, 9, 2, 6, 15, 128);
	-- Corbin - REPLACE WITH WALK TO POSITION!!!
	eq.unique_spawn(118331, 0, 0, 200, -2885, -150, 128);
	eq.signal(118331, 9);
end

function WarEnd(e)
	eq.depop_zone(false);
	eq.repop_zone();
end

function WarTriggers(e)
	local npcs = {};
	if stage == 1 then
		npcs = { [118340] = 10, [118338] = 1 };
	elseif stage == 2 then
		npcs = { [118344] = 8, [118346] = 2, [118339] = 1 };
	elseif stage == 3 then
		npcs = { [118342] = 8, [118335] = 2, [118343] = 1 };
	end
	
	if(e.message:findi("1")) then	-- south wave
		spawn_helper(npcs, 1, 1, 12, 40, 0)
	elseif(e.message:findi("2")) then	-- far east wave
		spawn_helper(npcs, 2, 6, 2, 20, 0)
	elseif(e.message:findi("3")) then	-- near east wave
		spawn_helper(npcs, 3, 12, 1, 10, 64)
	elseif(e.message:findi("4")) then	-- west -> north wave
		spawn_helper(npcs, 4, 6, 2, 20, 0)
	elseif(e.message:findi("5")) then	-- west -> river wave
		spawn_helper(npcs, 5, 6, 2, 20, 192)
	elseif(e.message:findi("stageone")) then
		stage = 1
	elseif(e.message:findi("stagetwo")) then
		stage = 2
	elseif(e.message:findi("stagethree")) then
		stage = 3
	elseif(e.message:findi("Narandi")) then
		last_fight()
	end
end

function WarTimers(e)
	if e.timer == "RingTenHB" then
		for _,v in pairs(Giants) do
			eq.signal(v, 99)
		end
		for _,v in pairs(Dwarves) do
			eq.signal(v, 99)
		end
		for _,v in pairs(Heroes) do
			eq.signal(v, 99)
		end
	elseif e.timer == "Group6" then
		eq.stop_timer("Group6");
		group6()
	elseif e.timer == "Group7" then
		eq.stop_timer("Group7");
		group7()
	elseif e.timer == "Group8" then
		eq.stop_timer("Group8");
		group8()
	elseif e.timer == "Group9" then
		eq.stop_timer("Group9");
		group9()
	end
end

function AllSpawn(e)
	
	local NpcID = e.self:GetNPCTypeID();
	
	if NpcID == 152018 then -- CHANGE THIS FROM NEXUS SCION!!!
		eq.set_timer("RingTenHB", 5000);
		eq.set_timer("Group6", 1000);
		eq.set_timer("Group7", 2000);
		eq.set_timer("Group8", 3000);
		eq.set_timer("Group9", 4000);
	-- check for NPCs that match list of giants and set their runspeed to SoW
	elseif is_in(NpcID, Giants) or NpcID == 118345 then
		e.self:ModifyNPCStat("runspeed","1.875");
	-- permaroot the permarooted mobs
	elseif is_in(NpcID, Statics) then
		e.self:ModifyNPCStat("runspeed","0");
	-- check for NPCs that match list of Dwarves and heroes and set them to run
	elseif is_in(NpcID, Dwarves) then
		e.self:SetRunning(true);
	elseif is_in(NpcID, Heroes) then
		e.self:SetRunning(true);
	end
end

function AllSignal(e)
	if e.signal >= 0 and e.signal <= 20 and not entity_data[e.self:GetID()] then
		-- sets paths for any naive NPCs (NPCs with set paths are unaffected)
		entity_data[e.self:GetID()] = load_entity_data(PathInfo[e.signal], e.self:GetX(), e.self:GetY(), e.signal);
		-- e.self:Shout("My groupID is: " .. entity_data[e.self:GetID()]['groupID'])
	end
	
	issue_move(e.self:GetID());
end

function AllCombat(e)
	if not e.joined then
		local min_dist = 100000;  -- arbitrarily large value to start
		local new_wp = entity_data[e.self:GetID()]['wp'];
		
		for i, v in ipairs(entity_data[e.self:GetID()]['path']) do
			distance = dist(e.self:GetX(), e.self:GetY(), v[1], v[2]);
			if distance < min_dist and i >= new_wp then
				min_dist = distance;
				new_wp = i
			end
		end

		entity_data[e.self:GetID()]['wp'] = new_wp
		-- ensures that mobs kited during walking phase get properly set to running when kited closer to end of path
		if new_wp > 1 and e.self:GetNPCTypeID() ~= 118345 then
			e.self:SetRunning(true);
		end
		
		issue_move(e.self:GetID())
	end
end

function AllWaypoint(e)
	if is_in(e.self:GetNPCTypeID(), Giants) then
		e.self:SetRunning(true);
	end
	
	entity_data[e.self:GetID()]['wp'] = entity_data[e.self:GetID()]['wp'] + 1;
	
	issue_move(e.self:GetID())
end

function issue_move(id)
	local status, wp = pcall(waypoint_helper, entity_data[id]);
	if status then
		eq.move_to(wp['x'], wp['y'], wp['z'], 0, true);
	end
end

function waypoint_helper(data)
	return get_waypoint(data['path'][data['wp']], data['x'], data['y'])
end

function get_waypoint(locs, offX, offY)
	local way = {};

	way['x'] = locs[1] + offX * locs[4];
	way['y'] = locs[2] + offY * locs[4];
	way['z'] = locs[3];
	
	return way
end

function load_entity_data(path, myX, myY, group)
	local off = {};
	local start_loc = path[0];
	
	off['x'] = myX - start_loc[1];
	off['y'] = myY - start_loc[2];
	off['wp'] = 1;
	off['path'] = path;
	off['groupID'] = group;
	
	return off
end

function round(num, dec)
	local temp = 10^dec;
	return math.floor(num * temp + .5) / temp;
end


function spawn_helper(npcs, path, col, row, spacing, heading)
	spawn_Mobs_tables(npcs, PathInfo[path][0], col, row, spacing, heading);
	for i in pairs(npcs) do
		eq.signal(i, path);
	end
end

function spawn_Mobs(npcId, startX, startY, startZ, endX, endY, endZ, heading, numMobs, grid)
	local xDiff = round((startX - endX) / numMobs, 2) * -1;
	local yDiff = round((startY - endY) / numMobs, 2) * -1;
	local zDiff = round((startZ - endZ) / numMobs, 2) * -1;
	
	for i = 0, numMobs-1 do
		eq.spawn2(npcId, grid, 0, startX + (xDiff*i), startY + (yDiff*i), startZ + (zDiff*i), heading);
	end
end

function spawn_Mobs_tables(npcs, locs, columns, rows, spacing, heading)
	-- npcs is a table of format { [npcID] = number_to_spawn }
	-- eq.zone_emote(13, 'SPAWN ENTERED');
	local startX = locs[1] - (rows / 2) * spacing;
	local startY = locs[2] - (columns / 2) * spacing;
	local startZ = locs[3];
	-- eq.zone_emote(13, 'LOCS ACQUIRED');
	
	-- iterate over whole table to get all keys
	local keyset = {};
	for k, v in pairs(npcs) do
		if v > 0 then
			table.insert(keyset, k)
		end
	end
	-- eq.zone_emote(13, 'KEYSET GENERATED');
	
	local empty = false;
	for j = 0, rows-1 do
		if empty then
			break
		end
		for i = 0, columns-1 do
			if next(keyset) == nil then
				empty = true
				break
			end
			
			local k = math.random(#keyset);
			local new_npc = keyset[k];
			eq.spawn2(new_npc, 0, 0, startX + spacing*j, startY + spacing*i, startZ, heading);
			-- eq.zone_emote(13, 'SPAWNED:' .. new_npc);
			npcs[keyset[k]] = npcs[keyset[k]] - 1;
			if npcs[keyset[k]] == 0 then
				table.remove(keyset, k)
			end
		end
	end

end



function load_paths()
	-- path format is X, Y, Z, spread multiplier (no spread multiplier for spawn location at this time)
	local wps = {};
	
	-- STATIC NPCS
	wps[0] = { [0] = {0, 0, 0} }; 
	
	-- GIANTS
	-- south spawn - line spawn
	wps[1] = { [0] = {250, -2300, -80}; [1] = {150, -1700, -10, .75}; [2] = {-50, -1000, 25, 0.35}; [3] = {-110, -20, 100, 0}; [4] = {-110, 50, 100, 0}};
	-- far east spawn (near spires) - clustered spawn
	wps[2] = { [0] = {-2400, -1900, -35}; [1] = {-2050, -850, 115, 1}; [2] = {-1900, -600, 75, 1}; [3] = {-50, -1000, 25, 0.5}; [4] = {-110, -20, 100, 0}; [5] = {-110, 50, 100, 0} };
	-- near east spawn (behind spearmen) - line spawn
	wps[3] = { [0] = {-1100, -2100, -55}; [1] = {0, -2050, -100, 0.75}; [2] = {-50, -1000, 25, 0.35}; [3] = {-110, -20, 100, 0}; [4] = {-110, 50, 100, 0} };
	-- west spawn, north route - clustered spawn
	wps[4] = { [0] = {1000, -2100, -65}; [1] = {1300, -1500, 170, 1}; [2] = {1600, -900, 330, 1}; [3] = {-50, -1000, 25, 0.5}; [4] = {-110, -20, 100, 0}; [5] = {-110, 50, 100, 0}  };
	-- west spawn, river route - clustered spawn
	wps[5] = { [0] = {1000, -2100, -65}; [1] = {600, -2000, -40, 1}; [2] = {600, -1300, 10, 1}; [3] = {-50, -1000, 25, 0.5}; [4] = {-110, -20, 100, 0}; [5] = {-110, 50, 100, 0}  };
	
	-- DWARVES
	-- Dobbin group at towers
	wps[6] = { [0] = {-10, -1080, 25} };
	-- Garadain group at spire
	wps[7] = { [0] = {-1800, -540, 70} };
	-- Churn group at Tizmak cave
	wps[8] = { [0] = {1600, -1000, 330} };
	-- Corbin group at Tizmak cave
	wps[9] = { [0] = {200, -2900, -150} };
	
	-- NARANDI
	wps[10] = { [0] = {250, -2300, -80}; [1] = {-1100, -2100, -55, 1}; [2] = {-2400, -1900, -35, 1}; [3] = {-4750, -1800, 240, 1}};
	return wps
end

function is_in(el, array)
	-- eq.zone_emote(12, 'Checking element: ' .. el);
	for i,v in pairs(array) do
		if v == el then
			return true
		end
	end

	return false
end

function dist(x1, y1, x2, y2)
	local dist = 0;
	dist = math.abs(x1 - x2) + math.abs(y1 - y2);
	
	return dist
end

function sleep(a)
	local sec = tonumber(os.clock() + a);
	while (os.clock() < sec) do
	
	end
end