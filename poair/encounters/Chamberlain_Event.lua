--Chamberlain Escalardian Event
--By Daeron

--mob tables
local event_mobs = {215409,215410,215411,215408,215429};
local trash_counter;
local mini_counter;


--failure variables
local fail_timer = 3 * 60 * 60;	--3 hr default


function event_encounter_load(e)
	--event variables
	EventReset();
	
	eq.set_timer("fail", fail_timer * 1000);
	--registered events
	GM_Message(15,"Chamberlain Escalardian Event Loaded!");	--debug
	--Trash Kill Counters
	eq.register_npc_event("Chamberlain_Event", Event.death_complete, 215000, TrashCounter);		--A_castellan_of_Air (215000)
	

	--Constable Kill Counters
	eq.register_npc_event("Chamberlain_Event", Event.death_complete, 215409, MiniCounter);		--Constable_Alranderisan (215409)
	eq.register_npc_event("Chamberlain_Event", Event.death_complete, 215410, MiniCounter);		--Constable_Belecohen (215410)
	eq.register_npc_event("Chamberlain_Event", Event.death_complete, 215411, MiniCounter);		--Constable_Ferabalen (215411)

	--Chamberlain or Apprentice Killed
	eq.register_npc_event("Chamberlain_Event", Event.death_complete, 215408, EventWin);			--#Chamberlain_Escalardian (215408)
	eq.register_npc_event("Chamberlain_Event", Event.death_complete, 215429, EventWin);			--#A_Chamberlain_PoAir`s_Apprentice (215429)
	
	--Chamberlain Memblur routine
	eq.register_npc_event("Chamberlain_Event", Event.timer, 215408, Memblur_Timer);			--#Chamberlain_Escalardian (215408)
	eq.register_npc_event("Chamberlain_Event", Event.combat, 215408, Chamberlain_Combat);			--#Chamberlain_Escalardian (215408)
end



function EventReset()
	eq.stop_all_timers();
	trash_counter = 1;	--event loads on death of first castellan
	mini_counter = 0;
	chamberlain = false;
end

function TrashCounter()
	trash_counter = trash_counter + 1;
	GM_Message(18,"Trash Check - counter [" .. trash_counter .. "/15]");	--debug
	
	if trash_counter == 5 then
		eq.unique_spawn(215409,0,0,400,478,-92,2);	--Constable_Alranderisan (215409)
	elseif trash_counter == 10 then
		eq.unique_spawn(215411,0,0,450,478,-92,2);	--Constable_Ferabalen (215411)
	elseif trash_counter == 15 then
		eq.unique_spawn(215410,0,0,500,478,-92,2);	--Constable_Belecohen (215410)
	end
end

function MiniCounter()
	local qglobals = eq.get_qglobals();
	local instance_id = eq.get_zone_instance_id();
	mini_counter = mini_counter + 1;
	GM_Message(18,"Mini Boss Check - counter [" .. mini_counter .. "/3]");	--debug
	
	if mini_counter == 3 then
		if qglobals[instance_id .. "_Chamberlain_PoAir"] == nil and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(215408) then		--verify qglobal flag not still active and he's not up
			local mob = eq.unique_spawn(215408,0,0,455,428,-92,2);	--#Chamberlain_Escalardian (215408)
			eq.set_timer("memblur", 15 * 1000, mob);
			chamberlain = true;
		else
			eq.unique_spawn(215429,0,0,455,428,-92,2);	--#A_Chamberlain_PoAir`s_Apprentice (215429)
		end
	end
end

function Chamberlain_Combat(e)
	if e.joined then
		eq.set_timer("memblur", math.random(12,24) * 1000);
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
		GM_Message(15,"ENCOUNTER FAILED!") --debug
		eq.signal(215424,2);	--signal #isle_one_controller (215424) to unload encounter
	end
end

function EventWin(e)
	eq.stop_all_timers();
	DepopEvent();
	if chamberlain == true then
		local instance_id = eq.get_zone_instance_id();
		eq.set_global(instance_id .. "_Chamberlain_PoAir", "1",3,"D3");  --3 day reset
	end
	eq.signal(215424,2);	--signal #isle_one_controller (215424) to unload encounter
end
	
function DepopEvent()	
	for _,mob in pairs(event_mobs) do
		eq.depop_all(mob);
	end
end

function GM_Message(color,text)			--DEBUGGING/MONITORING
	client_list = eq.get_entity_list():GetClientList();
	
	if client_list ~= nil then
		for client in client_list.entries do
			if client:GetGM() then
				client:Message(color,text);
			end
		end
	end
end

	