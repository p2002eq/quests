--Elemental Masterpiece Event (Isle #3)
--By Daeron

--mob tables
local event_mobs = {215400,215423};
local trash_counter;
local champion_counter;

--failure variables
local fail_timer = 3 * 60 * 60;	--3 hr default

function EventReset()
	eq.stop_all_timers();
	trash_counter = 1;	--event loads on death of first elemental
	champion_counter = 0;
end

function TrashCounter(e)
	trash_counter = trash_counter + 1;
	
	if trash_counter == 6 then
		eq.spawn2(215400,0,0,-500,-1282,320,131);	--#an_elemental_champion (215400)
	elseif trash_counter == 11 then
		eq.spawn2(215400,0,0,-445,-1224,320,254);	--#an_elemental_champion (215400)
	elseif trash_counter == 16 then
		eq.spawn2(215400,0,0,-400,-1282,320,388);	--#an_elemental_champion (215400)
	elseif trash_counter == 21 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(e.self:GetNPCTypeID()) then
		eq.spawn2(215400,0,0,-445,-1345,320,5);	--#an_elemental_champion (215400)
		eq.signal(215400,0,1*1000);	--signal activation to champions
	end
end

function Activate_Champions(e)
	e.self:SetBodyType(24, true);		--Sets bodytype as Summoned
	e.self:SetSpecialAbility(24,0);		--turn off immune to aggro
	e.self:SetSpecialAbility(35,0);		--turn off immunity to players
end

function FinalStageCheck()
	local qglobals = eq.get_qglobals();
	local instance_id = eq.get_zone_instance_id();
	champion_counter = champion_counter + 1;
	
	if champion_counter == 4 then
		if qglobals[instance_id .. "_AoSmoke_PoAir"] == nil then	--verify qglobal flag not still active 
			mob = eq.spawn2(215423,0,0,-435,-1280,326,381);	--#The_Elemental_Masterpiece (215423)			
		else
			eq.unique_spawn(215434,0,0,-435,-1280,326,381);	--#An_Elemental_Anomaly (215434)
		end
	end
end

function EventCombat(e)
	if e.joined then
		eq.set_timer("memblur", 12 * 1000);
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
		eq.signal(215426,2);	--signal #isle_three_controller (215426) to unload encounter
	end
end

function EventWin(e)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals();
	eq.stop_all_timers();
	DepopEvent();
		
	if qglobals[instance_id .. "_AoSmoke_PoAir"] == nil then
		eq.unique_spawn(215406,0,0,1395,-678,35,0);	--#Avatar_of_Smoke (215406)
	end
	
	eq.signal(215426,2);	--signal #isle_three_controller (215426) to unload encounter
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
	--Trash Kill Counters (Spawns/Activate Champions)
	eq.register_npc_event("Masterpiece_Event", Event.death_complete, 215012, TrashCounter);		--a_confused_air_elemental (215012)
	
	--Elemental Champion Trigger
	eq.register_npc_event("Masterpiece_Event", Event.signal, 215400, Activate_Champions);		--#an_elemental_champion (215400)
	eq.register_npc_event("Masterpiece_Event", Event.death_complete, 215400, FinalStageCheck);	--#an_elemental_champion (215400)
	
	--The_Elemental_Masterpiece or ph killed
	eq.register_npc_event("Masterpiece_Event", Event.death_complete, 215423, EventWin);			--#The_Elemental_Masterpiece (215423)
	eq.register_npc_event("Masterpiece_Event", Event.death_complete, 215434, EventWin);			--#An_Elemental_Anomaly (215434)	
		
	--The_Elemental_Masterpiece Memblur routine
	eq.register_npc_event("Masterpiece_Event", Event.combat, 215423, EventCombat);				--#The_Elemental_Masterpiece (215423)
	eq.register_npc_event("Masterpiece_Event", Event.timer, 215423, Memblur_Timer);				--#The_Elemental_Masterpiece (215423)
end
