--Stormrider Event (Isle #2)
--By Daeron

--mob tables
local spawnpoint_list = {365275, 365420, 365508, 365676, 366294, 366543, 366662, 366887, 367241, 367375, 367524, 365827, 365989, 366073, 367211, 365467, 365822, 366161, 366502, 365410, 367084, 367463, 365916, 366133, 366565, 367103, 366140};
local event_mobs = {215390,215431,215417,215433,215419,215430};
local trash_counter;
local sporadic_counter;
local sporadic;
local priest;
local counter;

--failure variables
local fail_timer = 3 * 60 * 60;	--3 hr default


function EventReset()
	eq.stop_all_timers();
	trash_counter = 1;	--event loads on death of first stormrider
	sporadic_counter = 0;
	sporadic = false;
	add_table = {};
	called_adds = {};	
	counter = 1;
end

function TrashCounter(e)
	if mob_check(e) then 
		trash_counter = trash_counter + 1;
		eq.GM_Message(18,"Trash Check - counter [" .. trash_counter .. "/27]");	--debug
	end
	
	if trash_counter == 27 and not spawn_check() then
		Phase2Setup();
	end
end

function mob_check(e)	--check if mob killed is related to the spawnpoint within the event since there are similar npcs listed outside
	for k,spawn_id in pairs(spawnpoint_list) do 
		if e.self:GetSpawnPointID() == spawn_id then
			return true;
		end
	end
	return false;
end

function spawn_check()	--verify all required spawns are dead
	for k,spawn_id in pairs(spawnpoint_list) do 
		if eq.get_entity_list():GetSpawnByID(spawn_id):NPCPointerValid() then
			return true;
		end
	end
	return false;
end

function Phase2Setup()	--Setup Priest of Destruction and untargetable versions of #a_menacing_stormrider (215431)
	add_table = {};
	local h = 400;
	local spawn_location	= {[1] = {-215,-853,112,475}, [2] = {-125,-694,112,390}, [3] = {-184,-522,109,305}, [4] = {-488,-569,109,160}, [5] = {-555,-747,108,80}, [6] = {-295,-678,114,h}, [7] = {-295,-661,114,h}, [8] = {-492,-830,108,86} };	--x,y,z,h
	local destination 		= {[1] = {-280,-690,114}, [2] = {-280,-678,114}, [3] = {-280,-661,114}, [4] = {-280,-649,114}, [5] = {-295,-690,114}, [6] = {-295,-678,114}, [7] = {-295,-661,114}, [8] = {-295,-649,114} };	--x,y,z,h
	
	for n = 1,8 do	--spawn #a_menacing_stormrider (215431) - All but #6 & #7 will path to their spawn.  #6 & #7 spawn at their destination
		add_table[n] = eq.spawn2(215431,0,0,unpack(spawn_location[n]));
		add_table[n]:CastToNPC():MoveTo(destination[n][1],destination[n][2], destination[n][3],h,true);
	end
	
	priest = eq.unique_spawn(215419,0,0,-260,-671,118,h);	--#Stormrider_Priest_of_Destruction (215419)
end

function PriestCombat(e)	--Call adds when Priest of Destruction is engaged
	if e.joined then
		eq.set_timer("adds", 2 * 1000)
	else
		eq.stop_timer("adds");
	end
end

function PriestTimer(e)
	if e.timer == "adds" then
		eq.stop_timer(e.timer);
		eq.set_timer("adds",30 * 1000);
		
		local n = 1;
		while n <= 2 do
			local add = math.random(1,8)
			if TableCheck(add,called_adds) then	--don't want to call the tablecheck function if
				table.insert(called_adds,counter, add);	
				counter = counter + 1;				
				n = n + 1;
				CallAdd(add_table[add],e);	--set special abilities and target to aggro
				eq.GM_Message(14,"Adds called: [" .. table.getn(called_adds) .. "]");	--debug
			elseif table.getn(called_adds) == 8 then
				break;	--don't want an infinite loop
			end
		end
	end
end

function TableCheck(ran, tab)
	for i,v in pairs(tab) do
		if v == ran then
			return false;	--already have this value in the table - skip and pick a different add	
		end
	end
	return true;	-- not a duplicate value - OK to proceed
end

function CallAdd(mob,e)
	mob:SetBodyType(1, true);		--Sets bodytype as Humanoid (targetable)
	mob:SetSpecialAbility(24,0);		--turn off immune to aggro
	mob:SetSpecialAbility(35,0);		--turn off immunity to players
	mob:AddToHateList(e.self:GetHateRandom(),1);
end

function Phase3Setup()	--Sporadic Stormriders
	for k,npc in pairs(add_table) do
		if not npc:IsEngaged() then	--check since all adds are given aggro upon activation.  Any non-activated adds should be depopped if priest dies
			npc:Depop(true);
		end
	end

	eq.spawn2(215390,0,0,-381,-822,108,6);		--#a_sporadic_stormrider (215390)
	eq.spawn2(215390,0,0,-131,-693,112,426);	--#a_sporadic_stormrider (215390)
	eq.spawn2(215390,0,0,-508,-680,118,96);		--#a_sporadic_stormrider (215390)
end

function FinalStageCheck()
	local qglobals = eq.get_qglobals();
	local instance_id = eq.get_zone_instance_id();
	sporadic_counter = sporadic_counter + 1;
	eq.GM_Message(18,"Sporadic counter [" .. sporadic_counter .. "/3]");	--debug
	
	if sporadic_counter == 3 then
		if qglobals[instance_id .. "_AoWind_PoAir"] == nil then	--verify qglobal flag not still active 
			local spawn_location = {[1] = {-360,-605,109,295}, [2] = {-388,-605,109,206}, [3] = {-383,-655,105,42}, [4] = {-345,-642,108,424}, [5] = {-400,-630,108,124} };
			local spawns = {};
			local n = 1;
			
			while n <= 5 do	--routine to randomize boss spawn locations
				local loc = math.random(1,5);
				if TableCheck(loc,spawns) then
					table.insert(spawns,n, loc);
					if n == 1 then	--first location chosen will always be the boss
						mob = eq.unique_spawn(215417,0,0,unpack(spawn_location[loc]));	--#Pherlondien_Clawpike (215417)
						pherlondien = true;	
					else
						eq.spawn2(215433,0,0,unpack(spawn_location[loc]));	--#Pherlondien_Clawpike_ (215433) -- fake versions (x4)
					end
					n = n + 1;
				end
			end
		else
			eq.unique_spawn(215430,0,0,-370,-630,108,480);	--#a_loathesome_stormclaw (215430)
		end
	end
end

function PherlCombat(e)
	if e.joined then
		eq.set_timer("memblur",12 * 1000);
	end
end

function Memblur_Timer(e)
	if e.timer == "memblur" then
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),50) then	--check if player is within 50 units
			if math.random(100) <= 40 then e.self:WipeHateList() end  	--40% memblur chance
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
		end
	end
end

function event_timer(e)
	if e.timer == "fail" then
		eq.stop_all_timers();
		DepopEvent();
		eq.signal(215425,2);	--signal #isle_two_controller (215425) to unload encounter
	end
end

function EventWin(e)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals();
	eq.stop_all_timers();
	DepopEvent();
	
	if qglobals[instance_id .. "_AoWind_PoAir"] == nil then
		eq.unique_spawn(215407,0,0,-1590,483,20,392);	--#Avatar_of_Wind (215407)
	end
	
	eq.signal(215425,2);	--signal #isle_two_controller (215425) to unload encounter
end
	
function DepopEvent()	
	for _,mob in pairs(event_mobs) do
		eq.depop_all(mob);
	end
end

function event_encounter_load(e)
	--event variables
	EventReset();
	eq.set_timer("fail", fail_timer * 1000);
	
	--registered events
	--Trash Kill Counters (Advance to Priest of Destruction)
	eq.register_npc_event("Stormrider_Event", Event.death_complete, 215002, TrashCounter);		--a_mischievous_stormrider (215002)
	eq.register_npc_event("Stormrider_Event", Event.death_complete, 215014, TrashCounter);		--a_fearsome_stormrider (215014)
	eq.register_npc_event("Stormrider_Event", Event.death_complete, 215013, TrashCounter);		--a_stormrider_lightningclaw (215013)
	
	--Priest of Destruction Events(Advance to sporadic stormriders)
	eq.register_npc_event("Stormrider_Event", Event.combat, 215419, PriestCombat);				--#Stormrider_Priest_of_Destruction (215419)
	eq.register_npc_event("Stormrider_Event", Event.timer, 215419, PriestTimer);				--#Stormrider_Priest_of_Destruction (215419)
	eq.register_npc_event("Stormrider_Event", Event.death_complete, 215419, Phase3Setup);		--#Stormrider_Priest_of_Destruction (215419)
	
	
	--Sporadic Stormrider Kill Counters (Advance to final stage)
	eq.register_npc_event("Stormrider_Event", Event.death_complete, 215390, FinalStageCheck);	--#a_sporadic_stormrider (215390)

	--Pherlondien or loathsome killed
	eq.register_npc_event("Stormrider_Event", Event.death_complete, 215417, EventWin);			--#Pherlondien_Clawpike (215417)
	eq.register_npc_event("Stormrider_Event", Event.death_complete, 215430, EventWin);			--#a_loathesome_stormclaw (215430)
	
	--Pherlondien Clawpike Memblur routine
	eq.register_npc_event("Stormrider_Event", Event.timer, 215417, Memblur_Timer);				--#Pherlondien_Clawpike (215417)	 
	eq.register_npc_event("Stormrider_Event", Event.combat, 215417, PherlCombat);				--#Pherlondien_Clawpike (215417)
end
