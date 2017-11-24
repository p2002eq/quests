--Scout Husman's Raid (Grimling War Event #1)
--scout pathing grid to Camp #1 = 501017



local spawnpoints = {335018, 335019, 335020, 335021, 335022, 335023, 335024}; 
local grimlings = {167721, 	--a_grimling_fighter (lvl 23-27) war
				   167252, 	--a_grimling_manacrafter (lvl 24-29) wiz
				   167722,	--a_grimling_deathbringer (lvl 23-27) sk
				   167250};	--a_grimling_pickpocket (25) rog
local wave = 0;
local scout = 167203;		--Scout Husman
local officer = 167719;		--a_grimling_officer

local wave_timer = 120; 		--in seconds
local pathing_target = {-109,-1202,-6}  --x,y,z of campfire location where spawned waves will path.  NPC radius checks done based on this spot as well.
local radius = 75;    --set radius of camp to check
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
	
	eq.register_npc_event("Husmans_Raid", Event.death_complete, 167719, Win);
	eq.register_npc_event("Husmans_Raid", Event.death_complete, 167203, Fail);

end

--checks camp for NPCS excluding scout
function CampCheck()
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if(npc_list ~= nil) then
		for npc in npc_list.entries do							 
			if npc:CalculateDistance(unpack(pathing_target)) <= radius and npc:GetNPCTypeID() ~= scout and not npc:IsPet() and npc:GetRace() ~= 216 then  --race 216 is to exclude horse NPCS
				return true	--mobs still in camp
			end
		end
	end
	
	return false	--camp clear
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

	--spawn location of mobs on hillside
	local xloc = {   -83,  -77,    -70,   -64,   -58,   -60};
	local yloc = { -1275, -1273, -1270, -1265, -1260, -1287};
	local zloc = {    28,    28,    28,    28,    30,    34};
	local hloc = {   232,   232,   232,   232,   232,   232};
	
	mobz = eq.spawn2(NPCID,0,0,xloc[loc] ,yloc[loc] ,zloc[loc],hloc[loc]);
	mobz:SetRunning(true);
	mobz:CastToNPC():MoveTo(pathing_target[1]+math.random(-10,10), pathing_target[2]+math.random(-10,10), pathing_target[3], -1,true)  --x,y,z,h

end


--Re-enables camp spawnpoints and respawns camp based on event success or failure
function RepopCamp()
	for _,spawns in pairs(spawnpoints) do
		local CampSpawn = eq.get_entity_list():GetSpawnByID(spawns);
		CampSpawn:Enable();
		CampSpawn:Reset();
		CampSpawn:Repop(1);
	end
	
	--encounter unload check
	if unload then
		eq.unload_encounter("Husmans_Raid");
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
		if repop then	--check is repop is met
			eq.stop_timer(e.timer);
			eq.set_timer("repop", repop_time * 1000);
		end
		
	--handles wave timer events
	elseif (e.timer == "waves") then
		if wave == 0 then
			eq.stop_timer(e.timer);
			eq.set_timer("waves", wave_timer * 1000)  -- sets time between waves
		elseif (wave == -1) then	--value to prevent mobs from spawning on wave after event failure/success
			eq.stop_timer(e.timer)
			return false;
		end
		wave = wave + 1;
		
		--chance for random 5th mob to spawn per wave
		local add = math.random(1,100);	
		
		--spawns grimlings on hillside
		spawn_mob(grimlings[1],1);	--a_grimling_fighter
		spawn_mob(grimlings[math.random(1,4)],2);
		spawn_mob(grimlings[math.random(1,4)],3);
		spawn_mob(grimlings[math.random(1,4)],4);
		if (add <= 30) then		--check for additional add spawn chance (30%)
			spawn_mob(grimlings[math.random(1,3)],5);
		end
		
		--officer spawn chance handling
		local off = OfficerSpawn(wave);		--get officer spawn chance
		local rand = math.random(1,100);	--random roll for comparison
		
		if (wave > 5 and off >= rand) then
			spawn_mob(officer,6);
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




