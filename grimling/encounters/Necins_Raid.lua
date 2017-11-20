--Captain Necins Raid (Grimling War Event #3)
--Captain pathing grid to Camp #6 & 7 raids setup = 22  
 


local spawnpoints = {	334970, 334971, 334972, 334973, 334974, 334975, 334976, 334977, 334978, 334979, 334980, 334981, 334982, 334983, 334984, 334985,  --larger camp spawns (Captain)
						334986, 334987, 334988, 334989, 334990, 334991, 334992, 334993, 334994};		--smaller camp spawns (sergeant)
						
local grimlings = {167678, 	--a_grimling_scout (lvl 34) war
				   167630,	--a_grimling_skullsplitter (33) war
				   167630,	--a_grimling_skullsplitter (33) war	(additional chance at this spawn when rolling random)
				   167675, 	--a_grimling_painsoother(33-35) clr
				   167670,  --a_grimling_dedicant (34) clr
				   167252,	--a_grimling_manacrafter (24-29) wiz
				   167146,  --a_grimling_skullspirit (34) nec
				   167676};	--a_grimling_pickpocket (33-35) rog



local wave = 0;
local captain = 167200;		--Captain Necin
local sergeant = 167515		--Sergeant Cursah
local officer = 167724;		--grimling_officer (set lvl to around 35)

local wave_timer = 60; 		--in seconds

--x,y,z,h of campfire location where spawned waves will path
local pathing_target = {[1] = {558,-682,-26},  --small camp with sergeant
						[2] = {1147, -87, 13}}	--larger camp  
local radius = {[1] = 75, [2] = 200};    --set radius of camp to check
local repop_time = 120;  	--in seconds  (for successful event completion)
local repop = false  
local unload = false;

 
function event_encounter_load(e)
	unload = false
	repop = false;
	wave = 0;
	eq.set_timer("camp_check",  5 * 1000);	--checks for camp being clear
	eq.set_timer("repop_check", 5 * 1000);  --checks to see if repop needed on death
	for n = 1,2 do 
		DepopCamp(n);	--despawn at both camps so repop function below doesn't double stack npcs
	end	
	RepopCamp();	--reset spawns at both camps via spawnpoints table.  you cannot pre-clear these.  			--debug - need to enable
	
	eq.register_npc_event("Necins_Raid", Event.death_complete, 167724, Win);	--death of grimling officer = successful ending of event
	eq.register_npc_event("Necins_Raid", Event.death_complete, 167200, Fail);	--Captain Necin's death ends event
	eq.register_npc_event("Necins_Raid", Event.death_complete, 167515, Fail);	--Sergeant Cursah's death ends event

end

--checks camp for NPCS excluding captain and sarge
function CampCheck(camp)
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if npc:CalculateDistance(unpack(pathing_target[camp])) <= radius[camp] and npc:GetNPCTypeID() ~= captain and npc:GetNPCTypeID() ~= sergeant and not npc:IsPet() then
				return true	--mobs still in camp
			end
		end
	end
	
	return false
end

function Fail()
	Necin = eq.get_entity_list():GetMobByNpcTypeID(captain);
	Cursah = eq.get_entity_list():GetMobByNpcTypeID(sergeant);
	
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(captain) then
		Cursah:Shout("One of ours has fallen, we cannot win!")
		Cursah:Depop(true);
	elseif not eq.get_entity_list():IsMobSpawnedByNpcTypeID(sergeant) then
		Necin:Shout("One of ours has fallen, we cannot win!")
		Necin:Depop(true);
	end
	repop_time = 1;
	Cleanup();
end

function Win()
	eq.signal(captain,1);  --signal success to captain to allow final hand-in
	Cleanup();
end

function Cleanup()
	repop = true;		--trigger to start repop timer on camp spawns
	wave = -1;			--sets waves to halt
	unload = true;		--trigger to unload encounter at end
end

function spawn_mob1(NPCID, loc)	--mob spawns at camp 1
	local xloc = { 481,  468,  458,  485,  474,  461,  479};
	local yloc = {-713, -718, -724, -722, -727, -733, -743};
	local zloc = { -18,  -16,  -15,  -15,  -14,  -14,  -13};
	local hloc = {  46,   46,   46,   46,   46,   46,   46};
	
	mobz = eq.spawn2(NPCID,0,0,xloc[loc] ,yloc[loc] ,zloc[loc],hloc[loc]);
	mobz:SetRunning(true);
	mobz:CastToNPC():MoveTo(pathing_target[1][1] + math.random(-10,10), pathing_target[1][2] + math.random(-10,10), pathing_target[1][3], -1, true)  --x,y,z,h
end

function spawn_mob2(NPCID, loc)	--mob spawns at camp 2
	local xloc = { 1210,  1220,  1230,  1208,  1218,  1228,  1242};
	local yloc = {  -88,   -87,   -86,   -78,   -76,   -75,   -79};
	local zloc = {   13,    13,    13,    13,    13,    13,    18};
	local hloc = {  186,   186,   186,   186,   186,   186,   186};
	
	mobz = eq.spawn2(NPCID,0,0,xloc[loc] ,yloc[loc] ,zloc[loc],hloc[loc]);
	mobz:SetRunning(true);
	mobz:CastToNPC():MoveTo(pathing_target[2][1]+math.random(-10,10), pathing_target[2][2]+math.random(-10,10), pathing_target[2][3], -1, true)  --x,y,z,h
end

--Re-enables camp spawnpoints and respawns camp based on event success or failure
function RepopCamp()
	for _,spawns in pairs(spawnpoints) do
		local CampSpawn = eq.get_entity_list():GetSpawnByID(spawns);
		CampSpawn:Enable();
		CampSpawn:Reset();
		CampSpawn:Repop(5);
	end
	
	if unload then
		eq.unload_encounter("Necins_Raid");
	end
end


function DepopCamp()
	for _,spawns in pairs(spawnpoints) do
		local npc_list = eq.get_entity_list():GetNPCList();

		if(npc_list ~= nil) then
			for npc in npc_list.entries do
				if npc:GetSpawnPointID() == spawns then
					npc:Depop(true);
				end
			end
		end
	end
end

function event_timer(e)
	--check for camp being clear before event begins
	if (e.timer == "camp_check") then
		if not CampCheck(1) and not CampCheck(2) then
			eq.stop_timer("camp_check");
			eq.get_entity_list():GetMobByNpcTypeID(captain):CastToNPC():Say("Good, we have taken the camps, they are sure to send reinforcements, we must hold them off.");  --captain
			eq.get_entity_list():GetMobByNpcTypeID(sergeant):CastToNPC():Say("Good, we have taken the camps, they are sure to send reinforcements, we must hold them off.");  --Sarge
			StartEvent();
		end
	elseif (e.timer == "repop") then
		RepopCamp();
		eq.stop_timer(e.timer);
	elseif(e.timer == "repop_check") then
		if repop then
			eq.stop_timer(e.timer);
			eq.set_timer("repop", repop_time * 1000);
		elseif not eq.get_entity_list():IsMobSpawnedByNpcTypeID(captain) or not eq.get_entity_list():IsMobSpawnedByNpcTypeID(sergeant) then
			Fail();
		end
		
	--handles wave timer events
	elseif (e.timer == "waves") then
		if wave == 0 then
			eq.stop_timer(e.timer);
			eq.set_timer("waves", wave_timer * 1000)  -- sets time between waves
		elseif (wave == -1) then
			eq.stop_timer(e.timer)
			return false;
		end
		wave = wave + 1;
		
		
		--chance for random 5th mob to spawn per wave
		local add = math.random(1,100);	
		
		--spawns grimlings on hillside
		for n = 1, 6 do 
			if n <= 4 then	--limit smaller camp wave numbers to 4 
				spawn_mob1(grimlings[math.random(1,8)],n);	
			end	
			spawn_mob2(grimlings[math.random(1,8)],n);	
		end
		
		--officer rolls
		local off = OfficerSpawn(wave);
		--local rand = math.random(1,100);
		--if wave == 1 then off = 100; end	--debug
		if off >= math.random(1,100) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(officer) then
			spawn_mob1(officer,7);
			eq.get_entity_list():GetMobByNpcTypeID(sergeant):CastToNPC():Shout("I've spotted the grimling officer lurking to the southeast of camp.  Show no mercy friends!");  --Sarge
			eq.stop_timer("waves");
		elseif off >= math.random(1,100) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(officer)	then
			eq.get_entity_list():GetMobByNpcTypeID(captain):CastToNPC():Shout("The grimling officer is on the west hills from camp! Quickly, do not let him escape alive!");  --captain
			spawn_mob2(officer,7);
			eq.stop_timer("waves");			
		end
	end
end

--handles officer probability based on wave
function OfficerSpawn(wave)
	
	if (wave == 30) then
		return 100;
	elseif (wave > 20) then
		return 50;
	elseif (wave > 15) then 
		return 30;
	elseif (wave > 10) then
		return 15;
	elseif (wave > 0) then
		return 5;
	end
end

function StartEvent()
	eq.set_timer("waves", math.random(30,60) * 1000);  --sets initial wave timer	
end


