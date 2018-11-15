--player.lua for Plane of Time B
--Original PEQ Script modified by Daeron of Project 2002

function event_enter_zone(e)
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.self);
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_click_door(e)
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.self);
	-- drop the door information into some local variable
	local door_id = e.door:GetDoorID();
	local entity_list = eq.get_entity_list();
	local open_type = entity_list:FindDoor(door_id):GetOpenType();
	local lock_pick = entity_list:FindDoor(door_id):GetLockPick();
	local tbl_id = nil;	--identifies slot in p1 & p2 & p3 door tables
	local phase = qglobals[eq.get_zone_instance_id() .."_potimeb_status"]
	--e.self:Message(14,"Door ID is: [" .. door_id .. "] Open Type: [" .. e.door:GetOpenType() .. "] Phase: [" .. phase .. "]");   --debug to easily check door IDs
	if ((door_id >= 5 and door_id <= 8) or (door_id >= 25 and door_id <= 32) or (door_id >= 42 and door_id <= 49)) then
		local phase1_doors = {	[1] = {5,6,7,8},		--fire
								[2] = {25,26,27,28},	--water
								[3] = {29,30,31,32},	--undead
								[4] = {42,43,44,45},	--earth
								[5] = {46,47,48,49} };	--air
		if (((phase == "Phase2") or (phase == "Phase3") or (phase == "Phase4") or (phase == "Phase5") or (phase == "Phase6")) or e.self:GetGM()) then
			tbl_id = door_check(door_id,phase1_doors);
			if tbl_id ~= nil then
				OpenDoors(e,door_id,phase1_doors[tbl_id]);	--open 4 door panels
			end
		else
			e.self:Message(10,"The wall feels both insubstantial and solid at the same time, almost as if you were not in phase with it.");
			e.door:ForceClose(e.self);	
		end
	elseif ((door_id >= 13 and door_id <= 16) or (door_id >= 33 and door_id <= 41)) then
		local phase2_doors = {	[1] = {13,14,15,16},		
								[2] = {33,34,35,36},	
								[3] = {38,39,40,41} };	
		if (((phase == "Phase3") or (phase == "Phase4") or (phase == "Phase5") or (phase == "Phase6")) or e.self:GetGM()) then
			tbl_id = door_check(door_id,phase2_doors);
			if tbl_id ~= nil then
				OpenDoors(e,door_id,phase2_doors[tbl_id]);	--open 4 door panels
			end
		else
			e.self:Message(10,"The wall feels both insubstantial and solid at the same time, almost as if you were not in phase with it.");
			e.door:ForceClose(e.self);	
		end	

	elseif (door_id == 62) then
		if ((phase == "Phase4" or phase == "Phase5" or phase == "Phase6") or e.self:GetGM()) then
			e.self:MovePCInstance(223,eq.get_zone_instance_id(),-395,0,350,127);
		else
			e.self:Message(10,"The wall feels both insubstantial and solid at the same time, almost as if you were not in phase with it.");
		end
		-- update player lockout to phase 3
		
	elseif (door_id == 24) then
		if ((phase == "Phase5" or phase == "Phase6") or e.self:GetGM()) then
			e.self:MovePCInstance(223,eq.get_zone_instance_id(),-410,0,5,127);
		else
			e.self:Message(10,"The wall feels both insubstantial and solid at the same time, almost as if you were not in phase with it.");
		end
		-- update player lockout to phase 4
	elseif (door_id == 51) then
		if ((phase == "Phase6") or e.self:GetGM()) then
			e.self:MovePCInstance(223,eq.get_zone_instance_id(),245,-1115,0,387);
		else
			e.self:Message(10,"The wall feels both insubstantial and solid at the same time, almost as if you were not in phase with it.");
		end
		-- update player lockout to phase 5
	elseif (door_id == 57 or door_id == 59) then
		if ((phase == "Phase6") or e.self:GetGM()) then
			return;
		else
			e.self:Message(10,"A mystical force seems to have the lever locked in place.");
			e.door:ForceClose(e.self);
		end	
		
	--door handling for phase 4 and phase 5 doors behind the gods that lead to their respective planes
	elseif ((door_id == 20) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223001)) and 
	(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223168))) then	--Rallos Zek (targetable/untargetable versions)
		e.self:MovePCInstance(214,0,-210,10,-35,0);	--plane of tactics
	elseif ((door_id == 18) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223000)) and 
	(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223167))) then	--Innoruuk (targetable/untargetable versions)
		e.self:MovePCInstance(76,0,-350,-360,5,256);	--plane of hate
	elseif ((door_id == 19) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223165)) and 
	(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223166))) then	--Cazic-Thule (targetable/untargetable versions)
		e.self:MovePCInstance(72,0,1029,-773,108,0);	--plane of fear
	elseif ((door_id == 17) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223077)) and 
	(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223078))) then	--TZ/VZ
		e.self:MovePCInstance(214,0,-210,10,-35,0);	--plane of tactics
	elseif ((door_id == 21) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223098)) and 
	(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223142))) then	--Bertoxxulous (targetable/untargetable versions)
		e.self:MovePCInstance(205,0,-1750,-1245,-58,0);	--plane of disease
	elseif ((door_id == 22) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223075))) then	--Terris Thule
		e.self:MovePCInstance(204,0,1668,282,212,0);	--plane of nightmare
	elseif ((door_id == 23) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223076))) then	--Saryrn
		e.self:MovePCInstance(207,0,-341,1706,-491,0);	--plane of torment
	elseif (door_id >= 17 and door_id <= 23) then
		e.self:Message(7,"Faint energy swirls slowly through the portal, but nothing happens.");
	end
end

function door_check(door,tbl)
	for n = 1,5 do
		for k,v in pairs(tbl[n]) do
			if door == v then
				return n;	--return table based on area
			end
		end
	end
end

function OpenDoors(e,door_id,tbl)
	for k,v in pairs(tbl) do
		if v ~= door_id then eq.get_entity_list():GetDoorsByDoorID(v):ForceOpen(e.self) end
	end
end


--GM ONLY CONTROLS--
function event_say(e)
	if e.self:GetGM() then 
		instance_id = eq.get_zone_instance_id();
		if e.message:find("event help") then
			e.self:Message(18,string.format("Plane of Time B GM controls available:  [%s] [%s] [%s] [%s] [%s]",eq.say_link("tb_pcontrols",false,"Select Phase"),
				eq.say_link("tb_reset",false,"Zone Reset (repop only)"),eq.say_link("tb_full_reset",false,"Full Zone Reset (clears lockouts)"),
				eq.say_link("tb_debug",false,"Toggle Player Count Reports"),eq.say_link("tb_moveraid",false,"Raid Port Options")));
		elseif e.message:find("tb_pcontrols") then
			e.self:Message(18,"[Phase Controls Menu]");
			e.self:Message(18,"This option will perform a light zone reset and set itself to the chosen event phase.");
			e.self:Message(18,string.format("Select the desired event phase: [%s] [%s] [%s] [%s] [%s] [%s]",eq.say_link("tb_p1",false,"Phase 1"),
				eq.say_link("tb_p2",false,"Phase 2"),eq.say_link("tb_p3",false,"Phase 3"),eq.say_link("tb_p4",false,"Phase 4"),eq.say_link("tb_p5",false,"Phase 5"),
				eq.say_link("tb_p6",false,"Phase 6")));
		elseif e.message:find("tb_moveraid") then
			e.self:Message(18,"[Raid Port Options]");
			e.self:Message(15,"This option will move EVERY non-GM client into the start location for the specified phase.  Phases 1 & 2 are not available for this option.");
			e.self:Message(18,string.format("Select a phase to move the raid: [%s] [%s] [%s] [%s]",eq.say_link("tb_pr_p3",false,"Phase 3"),
				eq.say_link("tb_pr_p4",false,"Phase 4"),eq.say_link("tb_pr_p5",false,"Phase 5"), eq.say_link("tb_pr_p6",false,"Phase 6")));
		elseif e.message:find("tb_pr_p3") then
			raidMove(3);
			e.self:Message(14,"Moving raid to [Phase 3]");
		elseif e.message:find("tb_pr_p4") then
			raidMove(4);
			e.self:Message(14,"Moving raid to [Phase 4]");
		elseif e.message:find("tb_pr_p5") then
			raidMove(5);
			e.self:Message(14,"Moving raid to [Phase 5]");
		elseif e.message:find("tb_pr_p6") then
			raidMove(6);
			e.self:Message(14,"Moving raid to [Phase 6]");
		elseif e.message:find("tb_p1") then
			ZoneReset(e);
			eq.set_global(instance_id.."_potimeb_status","Phase0",7,"F");
			e.self:Message(14,"[Phase 1 Loading]");
		elseif e.message:find("tb_p2") then
			ZoneReset(e);
			UpdateGlobals("Phase2");
			e.self:Message(14,"[Phase 2 Loading]");
		elseif e.message:find("tb_p3") then			
			ZoneReset(e);
			UpdateGlobals("Phase3");
			e.self:Message(14,"[Phase 3 Loading]");
		elseif e.message:find("tb_p4") then			
			ZoneReset(e);
			UpdateGlobals("Phase4");
			e.self:Message(14,"[Phase 4 Loading]");
		elseif e.message:find("tb_p5") then			
			ZoneReset(e);
			UpdateGlobals("Phase5");
			e.self:Message(14,"[Phase 5 Loading]");
		elseif e.message:find("tb_p6") then			
			ZoneReset(e);
			UpdateGlobals("Phase6");
			e.self:Message(14,"[Phase 6 Loading]");
		elseif e.message:find("tb_reset") then
			ZoneReset(e);	--depops zone and respawns controllers
			e.self:Message(14,"[Light Zone Reset Complete]");
		elseif e.message:find("tb_full_reset") then
			eq.delete_global(eq.get_zone_instance_id() .. "_potimeb_progress");
			eq.delete_global(eq.get_zone_instance_id() .. "_potimeb_p5_bertox");
			eq.delete_global(eq.get_zone_instance_id() .. "_potimeb_p5_cazic");
			eq.delete_global(eq.get_zone_instance_id() .. "_potimeb_p5_inny");
			eq.delete_global(eq.get_zone_instance_id() .. "_potimeb_p5_rallos");
			eq.delete_global(eq.get_zone_instance_id() .. "_potimeb_Anar");
			eq.delete_global(eq.get_zone_instance_id() .. "_potimeb_Terlok");
			eq.delete_global(eq.get_zone_instance_id() .. "_potimeb_Rythor");
			eq.delete_global(eq.get_zone_instance_id() .. "_potimeb_Kazrok");
			eq.delete_global(eq.get_zone_instance_id() .. "_potimeb_Neimon");
			ZoneReset(e);	--depops zone and respawns controllers
			e.self:Message(14,"[Full Zone Reset Complete]");
		elseif e.message:findi("tb_debug") then
			eq.signal(223097,99);
		elseif e.message:findi("test") then
			instance_id = eq.get_zone_instance_id();
			eq.set_global(instance_id .. "_potimeb_progress","Phase6",7,"H132");
		elseif e.message:findi("phase 2") then
			eq.signal(223097,2);
			eq.signal(223097,2);
			eq.signal(223097,2);
			eq.signal(223097,2);
			eq.signal(223097,2);
			local event_mobs = {223169,223170,223171,223172,223173}
			for k,v in pairs(event_mobs) do
				eq.depop_all(v);	--depop triggers
			end
		end
	end
end

function UpdateGlobals(phase)
	if phase ~= nil then
		eq.set_global(instance_id .. "_potimeb_status",phase,7,"H12");
		eq.set_global(instance_id .. "_potimeb_progress",phase,7,"H132");
	end
end

function ZoneReset(e)	--depops zone and reloads controllers
		eq.set_global(instance_id.."_potimeb_status","Phase0",7,"F");
		for i = 1, 10, 1 do
			eq.spawn_condition("potimeb",eq.get_zone_instance_id(),i,0);
		end
		eq.depop_zone(false);
		eq.get_entity_list():GetSpawnByID(371157):Repop(2);	--zone status
		eq.get_entity_list():GetSpawnByID(371158):Repop(2);
end

function raidMove(phase)	
	local port_locs = {[3] = {585,1110,496}, [4] = {-395,0,350}, [5] = {-410,0,5}, [6] = {330,0,5} };
	local client_list = eq.get_entity_list():GetClientList();
	for c in client_list.entries do
		if ((c.valid) and (not c:GetGM())) then
			local x = port_locs[phase][1] + math.random(-10,10);
			local y = port_locs[phase][2] + math.random(-10,10);
			local z = port_locs[phase][3];
			c:Message(15,"You can feel time bend around you as an unknown force advances you further into the plane!");
			c:MovePCInstance(223,instance_id,x,y,z,127);
		end
	end	
end