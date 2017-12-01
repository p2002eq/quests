--[[
Grimling Final War (General Staginar's Raid 1.0)
By Daeron

Vah NPCS's involved:
	Veteran_Cullin (167196)		--northernmost camp
	Veteran_Shiktan (167731) 	--northernmost camp
	Veteran_Kufur (167732)		--acrylia mines entrance	
	Veteran_Fhelik (167733)		--acrylia mines entrance ]]
 


local spawnpoints = {	334892, 334893, 334894, 334895, 334896, 334897, 334898, 334899, 334900, 334901, 334902, 334903, 334904, 334905, 334906, 334907, 334908, 334909, 334910, --North camp spawns
						334911, 334912, 334913, 334914, 334915, 334916, 334917, 334918, 334919, 334920,	--North camp spawns (continued)
						334863, 334864, 334865, 334866, 334867, 334868, 334869, 334870, 334871, 334872, 334873, 334874, 334875, 334876, 334877, 334878, 334879, 334880, 334881,	--acrylia caverns platforms
						334882, 334883, 334884, 334885, 334886, 334887, 334888, 334889, 334890, 334891};	--acrylia caverns platforms (continued)
						
local grimlings = {167730, 	--a_grimling_headsplitter (war)
				   167727,	--a_grimling_battlepriest (clr)
				   167729,	--a_grimling_deathdealer nec
				   167728,	--a_grimling_possessor enc
				   167735};	--a_grimling_arcanist (wiz)


	local wave = 0;
	local veterans = {167196, 167731, 167732, 167733};	--for looping iterations
local cullin = 167196;		--Veteran Cullin
local shiktan = 167731;		--Veteran Shiktan
local kufur = 167732;		--Veteran Kufur
local fhelik = 167733;		--Veteran Fhelik
local commander = 167734;		--grimling_high_commander (60)

local wave_timer = 60; 		--in seconds

--x,y,z,h of campfire location where spawned waves will path
local pathing_target = {[1] = {  797,  760, 10}, --acrylia caverns
						[2] = {-1048, 1089, 11} };  --northern camp
local radius = {[1] = 200, [2] = 200};    --set radius of camp to check
local repop_time = 30*60;  	--in seconds  (for successful event completion)
local repop = false  
local unload = false;

--event start triggers
local acrylia_clear = false
local north_clear = false;

 
function event_encounter_load(e)
	unload = false;
	repop = false;
	acrylia_clear = false;
	north_clear = false;
	wave = 0;
	eq.set_timer("camp_check",  1 * 1000);	--checks for camp being clear
	eq.set_timer("repop_check", 5 * 1000);  --checks to see if repop needed on death
	DepopCamp();	--despawn at both camps so repop function below doesn't double stack npcs
	RepopCamp();	--reset spawns at both camps via spawnpoints table.  you cannot pre-clear these.  			
	
	eq.register_npc_event("Final_War", Event.death_complete, 167734, Win);	--death of grimling high commander = successful ending of event
	eq.register_npc_event("Final_War", Event.death_complete, 167196, Fail);	--Veteran Cullin's death ends event
	eq.register_npc_event("Final_War", Event.death_complete, 167731, Fail);	--Veteran Shiktan's death ends event
	eq.register_npc_event("Final_War", Event.death_complete, 167732, Fail);	--Veteran Kufur's death ends event
	eq.register_npc_event("Final_War", Event.death_complete, 167733, Fail);	--Veteran Fhelik's death ends event
	

end

--checks camp for NPCS excluding vadrel and sarge
function CampCheck(camp)
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if npc:CalculateDistance(unpack(pathing_target[camp])) <= radius[camp] and npc:GetNPCTypeID() ~= cullin and npc:GetNPCTypeID() ~= shiktan  and npc:GetNPCTypeID() ~= kufur and npc:GetNPCTypeID() ~= fhelik and not npc:IsPet() and npc:GetRace() ~= 216 then
				return true	--mobs still in camp
			end
		end
	end
	
	return false
end

function Fail()
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(cullin) or not eq.get_entity_list():IsMobSpawnedByNpcTypeID(shiktan) or not eq.get_entity_list():IsMobSpawnedByNpcTypeID(kufur) or not eq.get_entity_list():IsMobSpawnedByNpcTypeID(fhelik) then
		for n = 1,4 do
			if eq.get_entity_list():IsMobSpawnedByNpcTypeID(veterans[n]) then
				vet = eq.get_entity_list():GetMobByNpcTypeID(veterans[n])
				vet:Shout("One of ours has fallen, we cannot win!")
				vet:Depop(true);
			end
		end
	end
	repop_time = 1;
	Cleanup();
end

function Win()
	eq.signal(cullin,1);  --signal success to cullin to allow final hand-in
	for n = 1,4 do
		vet = eq.get_entity_list():GetMobByNpcTypeID(veterans[n])
		vet:GMMove(-999, 1080 + (9 * n), 35, 180, true);
		vet:WipeHateList();
	end
	Cleanup();
end

function Cleanup()
	repop = true;		--trigger to start repop timer on camp spawns
	wave = -1;			--sets waves to halt
	unload = true;		--trigger to unload encounter at end
end

function spawn_mob1(NPCID, camp, loc) --FINAL WAR acrylia camp

	local spawn_loc = {[1] = {1035, 877, 73, 185}, [2] = {926,1080,159,149}, [3] = {512, 928, 45, 80}, [4] = {607, 628, -6, 33}, [5] = {865, 535, 28, 246}, [6] = {1061,655,39,218} };  --acrylia mines spawn points (considered camps 1 & 2)
	
	mobz = eq.spawn2(NPCID,0,0,spawn_loc[loc][1] + math.random(-10,10) ,spawn_loc[loc][2] + math.random(-10,10) ,spawn_loc[loc][3],spawn_loc[loc][4]);
	mobz:SetRunning(true);
	mobz:CastToNPC():MoveTo(pathing_target[camp][1] + math.random(-10,10), pathing_target[camp][2] + math.random(-10,10), pathing_target[camp][3], -1, true)  --x,y,z,h
	
	
	local target = eq.get_entity_list():GetRandomClient(pathing_target[camp][1], pathing_target[camp][2], pathing_target[camp][3],100 * 100)  --100 units from target
	mobz:AddToHateList(target,1);
end

function spawn_mob2(NPCID, camp, loc) --FINAL WAR northern camp spawnpoints

	local spawn_loc = {[1] = {-818, 1088, 103, 192}, [2] = {-921, 1201, 39 ,166}, [3] = {-1184, 1220, 40, 102}, [4] = {-1254, 1017, 85, 54}, [5] = {-1103, 911, 78, 22}, [6] = {-820, 909, -3, 217} } --northern camp spawnpoints
	
	mobz = eq.spawn2(NPCID,0,0,spawn_loc[loc][1] + math.random(-10,10) ,spawn_loc[loc][2] + math.random(-10,10) ,spawn_loc[loc][3],spawn_loc[loc][4]);
	mobz:SetRunning(true);
	mobz:CastToNPC():MoveTo(pathing_target[camp][1] + math.random(-10,10), pathing_target[camp][2] + math.random(-10,10), pathing_target[camp][3], -1, true)  --x,y,z,h
	
	local target = eq.get_entity_list():GetRandomClient(pathing_target[camp][1], pathing_target[camp][2], pathing_target[camp][3],100 * 100)
	mobz:AddToHateList(target,1);
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
		eq.unload_encounter("Final_War");
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
	--check for both camps being clear before waves begin
	if (e.timer == "camp_check") then
		if not CampCheck(1) and not acrylia_clear then
			eq.get_entity_list():GetMobByNpcTypeID(kufur):CastToNPC():Shout("Acrylia mines encampment is secured!");
			acrylia_clear = true;
		end
		if not CampCheck(2) and not north_clear then
			eq.get_entity_list():GetMobByNpcTypeID(cullin):CastToNPC():Shout("Northeast fort is secured!");
			north_clear = true;
		end
		
		if not CampCheck(1) and not CampCheck(2) then	--both clear - event can now start
			eq.stop_timer("camp_check");
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
		elseif not eq.get_entity_list():IsMobSpawnedByNpcTypeID(cullin) or not eq.get_entity_list():IsMobSpawnedByNpcTypeID(shiktan) or not eq.get_entity_list():IsMobSpawnedByNpcTypeID(kufur) or not eq.get_entity_list():IsMobSpawnedByNpcTypeID(fhelik) then
			Fail();
		end
	elseif e.timer == "event_emote" then
		eq.stop_timer(e.timer);
		eq.zone_emote(1,"The sound of grimling chants echoes throughout the surrounding hills.");
		eq.signal(cullin,50,5*1000);
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
		local loc = math.random(1,6);	--get random spawn location for acrylia caverns and northeast fort
		local loc2 = math.random (1,6);	--second location for acrylia caverns  only
		
		--commander rolls
		local comm = commanderSpawn(wave);
		if comm >= math.random(1,100) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(commander) then		--no north camp spawns on trigger - all scouts will move to acrylia
			eq.spawn2(commander,0, 0, -833, 1087, 88, 185);	--spawns high commander at north fort
			eq.get_entity_list():GetMobByNpcTypeID(commander):CastToNPC():Shout("The Master does not take kindly to tresspassers. Now you must die!");
			eq.signal(cullin,2,3*1000);
			
			for n = 1,5 do
				spawn_mob1(grimlings[math.random(1,5)], 1, loc);	--intentional double spawn from same location - final stand in the war
				spawn_mob1(grimlings[math.random(1,5)], 1, loc2);
				spawn_mob2(grimlings[math.random(1,5)], 2, 1);	--set spawn for northeast fort at high commander spawn location
			end
		else 
			for n = 1,5 do
				spawn_mob1(grimlings[math.random(1,5)], 1, loc);	--spawns 6 mobs each per camp location  (12 mobs at acrylia caverns and 6 mobs at north camp per wave)
				spawn_mob1(grimlings[math.random(1,5)], 1, loc2);
				spawn_mob2(grimlings[math.random(1,5)], 2, loc);
			end
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
	elseif (wave > 5) then
		return 5;
	else
		return 0;		
	end
end

function StartEvent()
	eq.set_timer("waves", math.random(60,75) * 1000);  --sets initial wave timer	
	eq.set_timer("event_emote", math.random(30,45) * 1000)  --event emote timer
end


