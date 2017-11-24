--Veteran Vadrels Raid (Grimling War Event #3)
--Vadrel pathing grid = 23 to north camps
 


local spawnpoints = {	334921,334922, 334923, 334924, 334925, 334926, 334927, 334928, 334929, 334930, 334931, 334932, 334933, 334934, 334935, 334936, 334937, --larger camp spawns (Veteran Vadrel)
						334938, 334939, 334940, 334941, 334942, 334943, 334944, 334945};		--smaller camp spawns (Veteran Cullin)
						
local grimlings = {167680, 	--a_grimling_veteran (42) war
				   167526,	--a_grimling_sorceress (40) wiz
				   167526,	--a_grimling_sorceress (40) wiz
				   167672, 	--a_grimling_fleshsoother (38-40) clr
				   167242,  --a_grimling_herbalist (34-37) shm
				   167616,	--a_grimling_dreamspinner (32-37) enc
				   167672, 	--a_grimling_fleshsoother (38-40) clr (additional chance)
				   167674};	--a_grimling_nightknife (40-42) rog



local wave = 0;
local vadrel = 167194;		--Veteran Vadrel
local cullin = 167196;		--Veteran Cullin
local commander = 167726;		--grimling_commander (set lvl to around 50)

local wave_timer = 60; 		--in seconds

--x,y,z,h of campfire location where spawned waves will path
local pathing_target = {[1] = {-717, 361, -12},  --small camp with Veteran Cullin
						[2] = {-1237, 500, 40}}	--larger camp 
local radius = {[1] = 100, [2] = 200};    --set radius of camp to check
local repop_time = 120;  	--in seconds  (for successful event completion)
local repop = false  
local unload = false;

 
function event_encounter_load(e)
	unload = false
	repop = false;
	wave = 0;
	eq.set_timer("camp_check",  5 * 1000);	--checks for camp being clear
	eq.set_timer("repop_check", 5 * 1000);  --checks to see if repop needed on death
	DepopCamp();	--despawn at both camps so repop function below doesn't double stack npcs
	RepopCamp();	--reset spawns at both camps via spawnpoints table.  you cannot pre-clear these.  			--debug - need to enable
	
	eq.register_npc_event("Vadrels_Raid", Event.death_complete, 167726, Win);	--death of grimling commander = successful ending of event
	eq.register_npc_event("Vadrels_Raid", Event.death_complete, 167194, Fail);	--Veteran Vadrel's death ends event
	eq.register_npc_event("Vadrels_Raid", Event.death_complete, 167196, Fail);	--Veteran Cullin's death ends event

end

--checks camp for NPCS excluding vadrel and sarge
function CampCheck(camp)
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if npc:CalculateDistance(unpack(pathing_target[camp])) <= radius[camp] and npc:GetNPCTypeID() ~= vadrel and npc:GetNPCTypeID() ~= cullin and not npc:IsPet() and npc:GetRace() ~= 216 then
				return true	--mobs still in camp
			end
		end
	end
	
	return false
end

function Fail()
	Vadrel = eq.get_entity_list():GetMobByNpcTypeID(vadrel);
	Cullin = eq.get_entity_list():GetMobByNpcTypeID(cullin);
	
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(vadrel) then
		Cullin:Shout("One of ours has fallen, we cannot win!")
		Cullin:Depop(true);
	elseif not eq.get_entity_list():IsMobSpawnedByNpcTypeID(cullin) then
		Vadrel:Shout("One of ours has fallen, we cannot win!")
		Vadrel:Depop(true);
	end
	repop_time = 1;
	Cleanup();
end

function Win()
	eq.signal(vadrel,1);  --signal success to vadrel to allow final hand-in
	Cleanup();
end

function Cleanup()
	repop = true;		--trigger to start repop timer on camp spawns
	wave = -1;			--sets waves to halt
	unload = true;		--trigger to unload encounter at end
end

function spawn_mob1(NPCID, loc)	--mob spawns at camp 1 on hillside
	
	local xloc = {-647, -640, -643, -635, -630, -639, -620};
	local yloc = { 401,  385,  392,  397,  389,  405,  404};
	local zloc = {  31,   31,   31,   39,   38,   36,   52};
	local hloc = { 180,  180,  180,  180,  180,  180,  180};
	
	mobz = eq.spawn2(NPCID,0,0,xloc[loc] ,yloc[loc] ,zloc[loc],hloc[loc]);
	mobz:SetRunning(true);
	mobz:CastToNPC():MoveTo(pathing_target[1][1] + math.random(-10,10), pathing_target[1][2] + math.random(-10,10), pathing_target[1][3], -1, true)  --x,y,z,h
end

function spawn_mob2(NPCID, loc)	--mob spawns at camp 2
	local xloc = {-1257, -1241, -1250, -1152, -1142, -1146, -1253};
	local yloc = {  618,   621,   619,   610,   603,   607,   637};
	local zloc = {   46,    47,    47,    41,    41,    41,    53};
	local hloc = {  123,   123,   123,   155,   155,   155,   123};
	
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
		eq.unload_encounter("Vadrels_Raid");
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
			eq.get_entity_list():GetMobByNpcTypeID(vadrel):CastToNPC():Say("Good, we have taken the camps, they are sure to send reinforcements, we must hold them off.");  --vadrel
			eq.get_entity_list():GetMobByNpcTypeID(cullin):CastToNPC():Say("Good, we have taken the camps, they are sure to send reinforcements, we must hold them off.");  --Sarge
			StartEvent();
		end
	elseif (e.timer == "repop") then
		DepopCamp();
		RepopCamp();
		eq.stop_timer(e.timer);
	elseif(e.timer == "repop_check") then
		if repop then
			eq.stop_timer(e.timer);
			eq.set_timer("repop", repop_time * 1000);
		elseif not eq.get_entity_list():IsMobSpawnedByNpcTypeID(vadrel) or not eq.get_entity_list():IsMobSpawnedByNpcTypeID(cullin) then
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
		
		--commander rolls
		local off = commanderSpawn(wave);
		--local rand = math.random(1,100);
		--if wave == 1 then off = 100; end	--debug
		if off >= math.random(1,100) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(commander)	then
			eq.get_entity_list():GetMobByNpcTypeID(vadrel):CastToNPC():Shout("The grimling commander is on the north hills! Quickly, do not let him escape alive!");  --vadrel
			spawn_mob2(commander,7);
			eq.stop_timer("waves");	
		elseif off >= math.random(1,100) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(commander) then
			spawn_mob1(commander,7);
			eq.get_entity_list():GetMobByNpcTypeID(cullin):CastToNPC():Shout("I've spotted the grimling commander on the west hills.  Show no mercy friends!");  --Cullin
			eq.stop_timer("waves");
		end
	end
end

--handles commander probability based on wave
function commanderSpawn(wave)
	
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


