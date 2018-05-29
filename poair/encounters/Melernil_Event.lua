--Melernil_Faal`Armanna Event (Isle #4 - Phoenix)
--By Daeron

--mob tables
local spawnpoint_list = {365361, 365877, 365962, 366345, 366581, 366599, 366641, 366886, 367294, 367348, 367438, 367538, 366509, 366899, 367065, 365270, 365682, 365957, 366313, 367373};
local event_mobs = {215385,215388,215435,215413};
local trash_counter;
local firesurger_counter;
local windsurger_counter;


--failure variables
local fail_timer = 3 * 60 * 60;	--3 hr default


function EventReset()
	eq.stop_all_timers();
	trash_counter = 1;	--event loads on death of first stormrider
	firesurger_counter = 0;
	windsurger_counter = 0;
end

function TrashCounter(e)
	if mob_check(e) then 
		trash_counter = trash_counter + 1;
		eq.GM_Message(18,"Trash Check - counter [" .. trash_counter .. "/20]");	--debug
	end
	
	if trash_counter == 20 and not spawn_check() then
		eq.spawn2(215385,0,0,380,-700,440,358);		--#a_phoenix_firesurger (215385)
		eq.spawn2(215385,0,0,305,-670,443,225);		--#a_phoenix_firesurger (215385)
		eq.spawn2(215385,0,0,273,-736,440,104);		--#a_phoenix_firesurger (215385)
		eq.spawn2(215385,0,0,339,-776,440,505);		--#a_phoenix_firesurger (215385)
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


function FireSurgerCheck()
	firesurger_counter = firesurger_counter + 1;
	eq.GM_Message(18,"Firesurger counter [" .. firesurger_counter .. "/4]");	--debug
	
	if firesurger_counter == 4 then
		eq.spawn2(215388,0,0,380,-700,440,358);		--#a_phoenix_windsurger (215388)
		eq.spawn2(215388,0,0,305,-670,443,225);		--#a_phoenix_windsurger (215388)
		eq.spawn2(215388,0,0,273,-736,440,104);		--#a_phoenix_windsurger (215388)
		eq.spawn2(215388,0,0,339,-776,440,505);		--#a_phoenix_windsurger (215388)
	end
end

function WindSurgerCheck()
	local qglobals = eq.get_qglobals();
	local instance_id = eq.get_zone_instance_id();
	windsurger_counter = windsurger_counter + 1;
	eq.GM_Message(18,"Windsurger counter [" .. windsurger_counter .. "/4]");	--debug
	
	if windsurger_counter == 4 then
		if qglobals[instance_id .. "_AoMist_PoAir"] == nil then	--verify Avatar of Mist event is ready
			eq.unique_spawn(215435,0,0,323,-715,442,245);	--#Melernil_Faal`Armanna (215435)
		else
			eq.unique_spawn(215437,0,0,323,-715,442,245);	--#a_firewing_imitor (215437)
		end
	end
end

function MelernilCombat(e)
	if e.joined then
		eq.set_timer("memblur",12 * 1000);
	end
end

function Memblur_Timer(e)
	if e.timer == "memblur" then
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),50) then	--check if player is within 50 units
			if math.random(100) <= 30 then e.self:WipeHateList() end  	--30% memblur chance
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
		end
	end
end

function event_timer(e)
	if e.timer == "fail" then
		eq.stop_all_timers();
		DepopEvent();
		eq.signal(215427,2);	--signal #isle_four_controller (215427) to unload encounter
	end
end

function EventWin(e)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals();
	eq.stop_all_timers();
	DepopEvent();
	
	if qglobals[instance_id .. "_AoMist_PoAir"] == nil then
		eq.unique_spawn(215405,0,0,-1580,-570,360,390);	--#Avatar_of_Mist (215405)
	end
	
	eq.signal(215427,2);	--signal #isle_four_controller (215427) to unload encounter
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
	eq.spawn2(215413,0,0,632,-646,446,380);	--#flaring_phoenix (215413)
	
	--registered events
	--Trash Kill Counters
	eq.register_npc_event("Melernil_Event", Event.death_complete, 215028, TrashCounter);		--a_phoenix_searedwing (215028)
	eq.register_npc_event("Melernil_Event", Event.death_complete, 215058, TrashCounter);		--a_phoenix_breezewing (215058)
	eq.register_npc_event("Melernil_Event", Event.death_complete, 215026, TrashCounter);		--a_wind_phoenix (215026)
	eq.register_npc_event("Melernil_Event", Event.death_complete, 215027, TrashCounter);		--servitor_of_Xegony (215027)
	eq.register_npc_event("Melernil_Event", Event.death_complete, 215324, TrashCounter);		--#Calebgrothiel (215324)

	
	--Phase 2 4X firesurgers then 4x windsurgers
	eq.register_npc_event("Melernil_Event", Event.death_complete, 215385, FireSurgerCheck);		--#a_phoenix_firesurger (215385)
	eq.register_npc_event("Melernil_Event", Event.death_complete, 215388, WindSurgerCheck);		--#a_phoenix_windsurger (215388)

	--melernil or PH killed
	eq.register_npc_event("Melernil_Event", Event.death_complete, 215435, EventWin);			--#Melernil_Faal`Armanna (215435)
	eq.register_npc_event("Melernil_Event", Event.death_complete, 215437, EventWin);			--#a_firewing_imitor (215437)
	
	--Melernil_Faal`Armanna Memblur routine
	eq.register_npc_event("Melernil_Event", Event.timer, 215435, Memblur_Timer);				--#Melernil_Faal`Armanna (215435)	 
	eq.register_npc_event("Melernil_Event", Event.combat, 215435, MelernilCombat);				--#Melernil_Faal`Armanna (215435)
end
