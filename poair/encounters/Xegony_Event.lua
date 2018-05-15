--Sigismond_Windwalker Event (Isle #5 - Spiders)
--By Daeron

local add_table = {	[1] = {215047,1,215416},	--a_djinni_Air_defender (215047), Humanoid(1), #Nuquernal_Belegrodian (215416)
					[2] = {215048,22,215414}, 	--a_deadly_cloudwalker (215048), Insect(22), #Huridaf_Vorgaasna (215414)
					[3] = {215049,21,215421},	--an_Air_phoenix_scout (215049), Animal(21), #Weruis_Herfadban (215421)
					[4] = {215050,24,215399},	--an_Air_infused_defender (215050), Summoned(24), #an_elemental_arbitor (215399)
					[5] = {215051,1,215422}, 	--servant_of_Air (215051), Humanoid(1), #Wesreh_Galleantan (215422)
					[6] = {215052,1,215418} };	--a_knight_of_Air (215052),Humanoid(1), #Rindaler_Egulrtan (215418)



function EventReset()
	guardNum = 0;
	called_guards = {};	--stores values 1-6 for add types
	counter = 0;
end

function XegonyHP(e)
	if e.hp_event == 85 then
		eq.set_next_hp_event(70);
		CallGuards();
	elseif e.hp_event == 70 then
		eq.set_next_hp_event(55);
		CallGuards();
	elseif e.hp_event == 55 then
		eq.set_next_hp_event(40);
		CallGuards();
	elseif e.hp_event == 40 then
		eq.set_next_hp_event(25);
		CallGuards();
	elseif e.hp_event == 25 then
		CallGuards();
	end
end

function EventSignal(e)
	if e.signal == 99 then
		e.self:SetBodyType(add_table[guardNum][2], true);		--Sets bodytype
		e.self:SetSpecialAbility(24,0);		--turn off immune to aggro
		e.self:SetSpecialAbility(35,0);		--turn off immunity to players
		e.self:AddToHateList(Xegony:GetHateRandom(),1);
	end
end

function EventTimers(e)
	if e.timer == "start" then
		eq.stop_timer(e.timer);
		eq.set_next_hp_event(85);
		eq.set_timer("memblur", 12 * 1000, Xegony);
		CallGuards();
	elseif e.timer == "memblur" then		
		if eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(),50) then	--check if player is within 50 units
			eq.GM_Message(15,"[" .. e.self:GetCleanName() .. "] Memblur!")
			if math.random(100) <= 30 then e.self:WipeHateList() end  	--30% memblur chance
		elseif not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
			if e.self:GetNPCTypeID() == 215056 then
				eq.set_timer("reset", 5 * 60 * 1000);
			end
		end
	elseif e.timer == "reset" and not e.self:IsEngaged() then
		eq.GM_Message(18,"Event is resetting!");
		eq.signal(215436,3);	--signal reset to #event_control_Xegony (215436)
	end
end

function TableCheck(ran, tab)
	for i,v in pairs(tab) do
		if v == ran then
			return false;	--already have this value in the table - skip and pick a different add	
		end
	end
	
	return true;	-- not a duplicate value - OK to proceed
end

function CallGuards()
	local guard = false;
	while not guard do
		guardNum = math.random(1,6)
		if TableCheck(guardNum,called_guards) then	
			guard = true;
			counter = counter + 1;		
			table.insert(called_guards,counter, guardNum);	
			eq.GM_Message(11,tostring(add_table[guardNum][1]));
			eq.signal(add_table[guardNum][1],99);
			eq.GM_Message(13,"Guard table [" .. guardNum .. "] called:  " .. eq.get_entity_list():GetMobByNpcTypeID(add_table[guardNum][1]):GetCleanName() .. "(" .. add_table[guardNum][1] .. ")");
			spawn_boss(guardNum);
		elseif table.getn(called_guards) == 6 then
			break;	--don't want an infinite loop
		end
	end
end

function spawn_boss(num)
	local final_boss_locs = {[1] = {18,427,1440,383}, [2] = {25,-230,1440,390}, [3] = {-200,-268,1440,440}, [4] = {-475,-310,1440,57}, [5] = {-345,360,1440,265}, [6] = {-540,260,1455,214}};
	
	local boss = eq.spawn2(add_table[num][3],0,0,unpack(final_boss_locs[num]));
	boss:AddToHateList(Xegony:GetHateRandom(),1);
	eq.set_timer("memblur",12 * 1000, boss);
end

function EventCombat(e)
	if e.joined then
		eq.set_timer("memblur",12 * 1000);
	end
end

function EventWin(e)
	eq.stop_all_timers();
	eq.spawn2(215412,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ()-20, e.self:GetHeading());	--#Essence_of_Air (215412)
	eq.signal(215436,2);	--#event_control_Xegony (215436)
end

function event_encounter_load(e)
	--event variables
	EventReset();
	eq.GM_Message(18,"EVENT LOADED!");
	Xegony = eq.get_entity_list():GetMobByNpcTypeID(215056);	--#Xegony_the_Queen_of_Air (215056)
	eq.set_timer("start", 45 * 1000, Xegony);
	
	--registered events
	--Memblur Timers
	eq.register_npc_event("Xegony_Event", Event.timer, -1, EventTimers);	
	
	--Memblur Engage Combat
	eq.register_npc_event("Xegony_Event", Event.combat, 215416, EventCombat);	--#Nuquernal_Belegrodian (215416)
	eq.register_npc_event("Xegony_Event", Event.combat, 215414, EventCombat);	--#Huridaf_Vorgaasna (215414)
	eq.register_npc_event("Xegony_Event", Event.combat, 215421, EventCombat);	--#Weruis_Herfadban (215421)
	eq.register_npc_event("Xegony_Event", Event.combat, 215399, EventCombat);	--#an_elemental_arbitor (215399)
	eq.register_npc_event("Xegony_Event", Event.combat, 215422, EventCombat);	--#Wesreh_Galleantan (215422)
	eq.register_npc_event("Xegony_Event", Event.combat, 215418, EventCombat);	--#Rindaler_Egulrtan (215418)
	eq.register_npc_event("Xegony_Event", Event.combat, 215056, EventCombat);	--#Xegony_the_Queen_of_Air (215056)

	--Wave Signals
	eq.register_npc_event("Xegony_Event", Event.signal, -1, EventSignal);			

	--Xegony HP Events
	eq.register_npc_event("Xegony_Event", Event.hp, 215056, XegonyHP);	--#Xegony_the_Queen_of_Air (215056)
	
	--Xegony Dead
	eq.register_npc_event("Xegony_Event", Event.death_complete, 215056, EventWin);			--#Xegony_the_Queen_of_Air (215056)
end
