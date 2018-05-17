--Sigismond_Windwalker Event (Isle #5 - Spiders)
--By Daeron

--mob tables
local spawnpoint_list = {366142, 366079, 366392, 366471, 366673, 366772, 366814,366826, 367199, 367344, 367476, 365476, 365511, 365533,366023, 366752, 366761, 365366, 365611, 365661, 365778,365370, 365791, 365869, 365917, 365980, 366156, 367200, 365694, 365768, 365770,365781, 366466, 366538, 366934, 367087, 367172, 365373};
local event_mobs = {215401,215392,215393};
local trash_counter;
local archwalker_counter;
local minispawn_counter;
local size_count;
local Sigismond;

--failure variables
local fail_timer = 3 * 60 * 60;	--3 hr default


function EventReset()
	eq.stop_all_timers();
	trash_counter = 1;	--event loads on death of first stormrider
	archwalker_counter = 0;
	minispawn_counter = 0;
	size_count = 0;
	phase2 = false;
end

function TrashCounter(e)
	if mob_check(e) then 
		trash_counter = trash_counter + 1;
	end
	
	if trash_counter == 10 then
		eq.signal(215375,2);	--Sigismond_Windwalker (215375)
	elseif trash_counter == 20 then
		eq.signal(215375,2);	--Sigismond_Windwalker (215375)
	elseif trash_counter == 25 then
		eq.signal(215375,2);	--Sigismond_Windwalker (215375)
	elseif trash_counter == 30 then
		eq.signal(215375,2);	--Sigismond_Windwalker (215375)
	elseif trash_counter == 35 then
		eq.signal(215375,2);	--Sigismond_Windwalker (215375)
	elseif trash_counter == 38 and not spawn_check() and not phase2 then
		phase2 = true;
		archwalker = eq.spawn2(215392,0,0,-436,607,435,30);	--#a_vorladien_archwalker (215392)
		eq.set_timer("adds", 15 * 1000, Sigismond); 
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

function Archwalker(e)
	archwalker_counter = archwalker_counter + 1;
	
	if archwalker_counter < 3 then
		num = math.random(1,3);
		for n = 1,num do 
			eq.spawn2(215393,0,0,e.self:GetX() + math.random(-5,5), e.self:GetY() + math.random(-5,5), e.self:GetZ(), e.self:GetHeading());	--#a_vorladien_spawn (215393)
		end
	elseif archwalker_counter == 3 then
		eq.signal(215375,1);	--Sigismond_Windwalker (215375)
	end
end

function SpawnCheck(e)
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(215393) then
		archwalker = eq.spawn2(215392,0,0,-436,607,435,30);	--#a_vorladien_archwalker (215392)
	end
end

function SigismondSignal(e)
	if e.signal == 1 then
		e.self:SetBodyType(22, true);		--Sets bodytype as Insect (targetable)
		e.self:SetSpecialAbility(24,0);		--turn off immune to aggro
		e.self:SetSpecialAbility(35,0);		--turn off immunity to players
		if GetTarget() ~= nil then
			e.self:AddToHateList(target,1);
		end
		eq.set_timer("memblur",12 * 1000);
	elseif e.signal == 2 then
		local size_table = {6,8,12,16,20}
		size_count = size_count + 1;
		if size_count > 0 and size_count <= 5 then
			e.self:ChangeSize(size_table[size_count]);
		end
	end
end

function GetTarget()	--select a random target that is not feigned or a GM
	target = eq.get_entity_list():GetRandomClient(-405,425,430,600*600)
	if target.valid and not target:GetFeigned() and not target:GetGM() then	
		return target;
	end
	
	--if no targets found in range - check targets for assist
	local mob_tbl = {215375,215392,215393};
	for k,v in pairs(mob_tbl) do
		mob = eq.get_entity_list():GetMobByNpcTypeID(v);
		if mob ~= nil and mob:IsEngaged() then
			target = mob:GetHateRandom();
			return target;
		end
	end
	target = nil;
end

function SigismondCombat(e)
	if e.joined then
		eq.set_timer("memblur",12 * 1000);
	end
end

function SigismondTimer(e)
	if e.timer == "memblur" then
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),50) then	--check if player is within 50 units
			if math.random(100) <= 30 then e.self:WipeHateList() end  	--30% memblur chance
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
		end
	elseif e.timer == "adds" then
		if Sigismond:IsEngaged() or archwalker:IsEngaged() then
			spawn_spiders(e);
		end
	end
end

function spawn_spiders(e)		
	local max_adds = 15;
	local count = 0;
	
	local mob_list = eq.get_entity_list():GetMobList()
	if mob_list ~= nil then	
		for mob in mob_list.entries do
			if mob:GetNPCTypeID() == 215401 then
				count = count + 1;
			end
		end
	end
		
	if count < max_adds then	--if less than 15 mobs up then spawn additional spiders
		for n = 1, max_adds - count do
			mob = eq.spawn2(215401,0,0,-405 + math.random(-200,200), 697 + math.random(-200,200), 445, 255);	--spawn or repop #an_erratic_arachnid (215401)
			eq.set_timer("depop", 2 * 60 * 1000, mob);
			eq.set_timer("aggro",15 * 1000, mob);
			if GetTarget() ~= nil then
				mob:AddToHateList(target,1);
			end
		end
	end
end

function AddTimers(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	elseif e.timer == "aggro" and not e.self:IsEngaged() then
		if GetTarget() ~= nil then
			e.self:AddToHateList(target,1);
		end
	end
end

function event_timer(e)
	if e.timer == "fail" then
		eq.stop_all_timers();
		DepopEvent();
		eq.depop_with_timer(215375);	--Sigismond_Windwalker (215375)
		eq.signal(215428,2);	--signal #isle_five_controller (215428) to unload encounter
	end
end

function EventWin(e)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals();
	eq.stop_all_timers();
	DepopEvent();
	
	if qglobals[instance_id .. "_AoDust_PoAir"] == nil then
		eq.unique_spawn(215404,0,0,1655,525,360,390);	--#Avatar_of_Dust (215404)
	end
	eq.depop_all(215401);	--#an_erratic_arachnid (215401)
	eq.signal(215428,2);	--signal #isle_five_controller (215428) to unload encounter
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
	Sigismond = eq.get_entity_list():GetMobByNpcTypeID(215375);

	--registered events
	--Trash Kill Counters (Advance to Priest of Destruction)
	eq.register_npc_event("Sigismond_Event", Event.death_complete, 215060, TrashCounter);		--#Lossenmachar (215060)
	eq.register_npc_event("Sigismond_Event", Event.death_complete, 215044, TrashCounter);		--a_pristine_recluse (215044)
	eq.register_npc_event("Sigismond_Event", Event.death_complete, 215045, TrashCounter);		--a_vorladien_webspinner (215045)
	eq.register_npc_event("Sigismond_Event", Event.death_complete, 215001, TrashCounter);		--a_prismatic_recluse (215001)
	eq.register_npc_event("Sigismond_Event", Event.death_complete, 215043, TrashCounter);		--a_crystalline_windwalker (215043)

	
	--Vorladien Archwalker & Vorladien Spawn counters 
	eq.register_npc_event("Sigismond_Event", Event.death_complete, 215392, Archwalker);			--#a_vorladien_archwalker (215392)
	eq.register_npc_event("Sigismond_Event", Event.death_complete, 215393, SpawnCheck);			--#a_vorladien_spawn (215393)

	--Sigismond_Windwalker
	eq.register_npc_event("Sigismond_Event", Event.death_complete, 215375, EventWin);			--Sigismond_Windwalker (215375)
	eq.register_npc_event("Sigismond_Event", Event.timer, 215375, SigismondTimer);				--Sigismond_Windwalker (215375)
	eq.register_npc_event("Sigismond_Event", Event.combat, 215375, SigismondCombat);			--Sigismond_Windwalker (215375)
	eq.register_npc_event("Sigismond_Event", Event.signal, 215375, SigismondSignal);			--Sigismond_Windwalker (215375)
	
	--erratic adds
	eq.register_npc_event("Sigismond_Event", Event.timer, 215401, AddTimers);			--#an_erratic_arachnid (215401)
end
