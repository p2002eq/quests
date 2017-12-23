--[[
Mujaki_the_Devourer Encounter
By Daeron
]]

--Mujaki Instance 1 boundaries
local min_x = 100;	
local max_x = 1200;
local min_y = -3050
local max_y = -2000;

--platform coordinates by Mujaki
local platform_min_x = 530;
local platform_max_x = 720;
local platform_min_y = -2690;
local platform_max_y = -2410;

--wave related variables/counters
local wave = 0;
local mob_count = {1,2,2,2,1,2,2}		
local knight_counter = 0;	
local kill_count = 0;


--Mujaki Definitions
local Mujaki;		--Mujaki_the_Devouerer (Mob entity type)
local Mujaki_id = 204039;	--NPC ID
local Mujaki_spawnpoint_id = 345999;	--Encounter #1 Spawnpoint

local start_timer = 30;		--30 seconds (90 sec total till waves start)
local wave_timer = 120; 		--in seconds (2 min default)

local repop_time = 5*60;  	--in seconds  (for successful event completion - time to repop steeds.  This will be similar to Mujaki respawn time)
local repop = false  
local activated = false;


 
function event_encounter_load(e)
	--event variables
	Mujaki = GetMujaki();	
	repop = false;
	Cleanup();
	
	--event timers
	eq.set_timer("start",  start_timer * 1000);	
		
	--registered events
	eq.zone_emote(4,"Mujaki Encounter started!");	--debug	
	eq.register_npc_event("Mujaki_1", Event.timer, 204039, Mujaki_Timers);	
	eq.register_npc_event("Mujaki_1", Event.signal,204039, Reset_Signal);	
	eq.register_npc_event("Mujaki_1", Event.death_complete, 204039, Win);	--Mujaki's death unloads the encounter
	eq.register_npc_event("Mujaki_1", Event.death_complete, 204081, KillCounter);	--tracks death counter of servants
end

function Mujaki_Timers(e)
	if e.timer == "waves" then
		if wave < 7 then		--7 waves total - 36 total mobs will spawn per event
			wave = wave + 1;
			spawn_servants();
			if mob_count[wave] == 2 then
				eq.set_timer("second wave", 3 * 1000, Mujaki);	--spawn 2nd round at slight delay
			end
		else
			eq.stop_timer(e.timer);
		end
	elseif e.timer == "MujakiHB" then
		CheckGuards();			--checks incoming servants on foot to transform into riders when they reach the platform
		Mujaki_Activation();	--makes Mujaki targetable when kill count or rider count sum to 36
	elseif e.timer == "second wave" then
		eq.stop_timer(e.timer);
		spawn_servants();
	end
end

function event_timer(e)
	if e.timer == "start" then
		eq.stop_timer(e.timer);
		eq.set_timer("waves", wave_timer * 1000, Mujaki);
		eq.set_timer("MujakiHB",1, Mujaki);
		eq.set_timer("EventHB", 1 * 1000);  
	elseif e.timer == "EventHB" and repop == true then
		eq.stop_timer(e.timer);
		eq.set_timer("repop", repop_time * 1000);
	elseif e.timer == "repop" then
		eq.stop_timer(e.timer);
		Repop();	--repop shadow_steeds to allow event to trigger again
	end
end

function KillCounter(e)
	if e.self:GetX() > 100 and e.self:GetX() < 1200 and e.self:GetY() > -3050 and e.self:GetY() < -2000 then	--instance #1 boundaries
		kill_count = kill_count + 1;
	end
end

function spawn_servants()
	local grave_locs = { 	[1] = {237,-2662,173,65},		--East Tomb
							[2] = {637,-2995,174,255}, 		--South Tomb
							[3] = {1019,-2664,176,193}};	--West Tomb
	for n = 1,3 do
		servant = eq.spawn2(204081,0,0,unpack(grave_locs[n]));
		servant:CastToNPC():MoveTo(626,-2657,176,-1,true);
	end
end
	

function CheckGuards()
	local npc_list = eq.get_entity_list():GetNPCList();
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if  npc:GetNPCTypeID() == 204081  and npc:GetX() >  platform_min_x and npc:GetX() <  platform_max_x and npc:GetY() >  platform_min_y and npc:GetY() <  platform_max_y and not npc:IsEngaged() then	--checks for Mujaki based on encounter boundaries defined
				npc:Depop();	--depop servant and spawn knight rider version
				
				local knight = eq.spawn2(204082,0,0,npc:GetX(),npc:GetY(),npc:GetZ(),npc:GetHeading());
				knight:CastToNPC():MoveTo(Mujaki:GetX() + math.random(-45,45), Mujaki:GetY() + math.random(25,50), Mujaki:GetZ(),130,true);
				knight_counter = knight_counter + 1;
			end
		end
	end
end

function Mujaki_Activation()
	local total = knight_counter + kill_count;
	if total == 36 and not activated then
		activated = true;
		eq.signal(Mujaki_id,50); 	--signal Mujaki to activate
	end
end

	
function GetMujaki()
	local npc_list = eq.get_entity_list():GetNPCList();
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if  npc:GetNPCTypeID() == 204039  and npc:GetX() > min_x and npc:GetX() < max_x and npc:GetY() > min_y and npc:GetY() < max_y then	--checks for Mujaki based on encounter boundaries defined
				return npc;	--return Mujaki 
			end
		end
	end
end

function Win()	
	if not eq.get_entity_list():GetSpawnByID(Mujaki_spawnpoint_id):NPCPointerValid() then	--confirms specific Mujaki is dead for this instance
		Cleanup();
		repop = true;
	end
end

function Cleanup()
	wave = 0;
	knight_counter = 0;
	kill_count = 0;
	activated = false;
end


function Repop()
	local steed_spawnpoints = {345939, 345940, 345941};	--instance 1 steed spawnpoints
	for _,steeds in pairs(steed_spawnpoints) do
		local steed = eq.get_entity_list():GetSpawnByID(steeds);
		if not steed:NPCPointerValid() then
			steed:Repop(5);
		end
	end
	eq.unload_encounter("Mujaki_1");
end





