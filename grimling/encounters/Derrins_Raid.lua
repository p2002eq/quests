--Scout Derrin's Raid (Grimling War Event #3)
--scout pathing grid to Camp #3 = 20

local spawnpoints = {334995, 334996, 334997, 334998, 334999, 335000, 335001, 335002, 335003, 335004, 335005, 335006, 335007, 335138}; 
local grimlings = {167721, 	--a_grimling_fighter (lvl 23-27) war
				   167252, 	--a_grimling_manacrafter (lvl 24-29) wiz
				   167722,	--a_grimling_deathbringer (lvl 23-27) sk
				   167250};	--a_grimling_pickpocket (25) rog



local wave = 0;
local scout = 167201;
local officer = 167723;		--grimling_officer (set lvl to around 35)

local wave_timer = 60; 		--in seconds 
local pathing_target = {1043,-1055,20}  --x,y,z,h of campfire location where spawned waves will path
local radius = 175;    --set radius of camp to check
local repop_time = 120;  	--in seconds  (for successful event completion)
local repop = false  
local unload = false;

 
function event_encounter_load(e)
	unload = false
	repop = false;
	wave = 0;
	eq.set_timer("camp_check",  5 * 1000);	--checks for camp being clear
	eq.set_timer("repop_check", 5 * 1000);  --checks to see if repop needed on death
	DepopCamp();
	RepopCamp();


	eq.register_npc_event("Derrins_Raid", Event.death_complete, 167723, Win);
	eq.register_npc_event("Derrins_Raid", Event.death_complete, 167201, Fail);

end

--checks camp for NPCS excluding scout
function CampCheck()
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if npc:CalculateDistance(unpack(pathing_target)) <= radius and npc:GetNPCTypeID() ~= scout and not npc:IsPet() and npc:GetRace() ~= 216 then
				return true	--mobs still in camp
			end
		end
	end
	
	return false
end

function Fail()
	repop_time = 1;
	Cleanup();
end

function Win()
	eq.signal(scout,1);  --signal success to captain to allow final hand-in
	Cleanup();
end

function Cleanup()
	repop = true;		--trigger to start repop timer on camp spawns
	wave = -1;			--sets waves to halt
	unload = true;		--trigger to unload encounter at end
end

function spawn_mob(NPCID, loc)
	local xloc = { 1104,  1094,  1022,  1035,  1108,  1118,  1025};
	local yloc = {-1089, -1101, -1143, -1138, -1103, -1106, -1155};
	local zloc = {   13,    13,    28,    20,    13,    13,    31};
	local hloc = {  436,   436,    18,    18,   436,   436,    18};
	
	mobz = eq.spawn2(NPCID,0,0,xloc[loc] ,yloc[loc] ,zloc[loc],hloc[loc]);
	mobz:SetRunning(true);
	mobz:CastToNPC():MoveTo(pathing_target[1]+math.random(-10,10), pathing_target[2]+math.random(-10,10), pathing_target[3], -1, true)  --x,y,z,h
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
		eq.unload_encounter("Derrins_Raid");
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
		if not CampCheck(e.self) then
			eq.stop_timer("camp_check");
			eq.get_entity_list():GetMobByNpcTypeID(scout):CastToNPC():Say("Good, we have taken the camp, they are sure to send reinforcements, we must hold them off.");  --scout
			StartEvent();
		end
	elseif (e.timer == "repop") then
		RepopCamp();
		eq.stop_timer(e.timer);
	elseif(e.timer == "repop_check") then
		if repop then
			eq.stop_timer(e.timer);
			eq.set_timer("repop", repop_time * 1000);
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
		spawn_mob(grimlings[1],1);		--a_grimling_fighter
		spawn_mob(grimlings[math.random(1,4)],2);		
		spawn_mob(grimlings[math.random(1,4)],3);
		spawn_mob(grimlings[math.random(1,4)],4);
		if (add <= 50) then		--check for 2 add spawns spawn chance (50%)
			spawn_mob(grimlings[math.random(1,4)],5);	
			spawn_mob(grimlings[math.random(1,4)],6);	
		elseif (add <= 75) then	--75% chancen for 5 spawns
			spawn_mob(grimlings[math.random(1,4)],5);	
		end
		
		--officer rolls
		local off = OfficerSpawn(wave);
		local rand = math.random(1,100);
		if (wave > 5 and off >= rand) then
			spawn_mob(officer,7);
			eq.get_entity_list():GetMobByNpcTypeID(scout):CastToNPC():Say("The grimling officer is upon us!  Take him out and show me proof of his demise!");
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
	elseif (wave > 5) then
		return 5;
	elseif wave > 0 then
		return 0;
	end
end

function StartEvent()
	eq.set_timer("waves", math.random(30,60) * 1000);  --sets initial wave timer	
end


