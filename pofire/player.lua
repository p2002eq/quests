--player.lua for
--PoFire

function event_enter_zone(e)
    local instance_id = eq.get_zone_instance_id();
    local instance_version = eq.get_zone_instance_version();
    local discs = require('disciplines');
    discs:update_discs(e, e.self:GetLevel());

    if(instance_id ~= 0) then
        e.self:Message(15,"You have entered an Instanced Version of the zone.");
    end
end

function event_level_up(e)
    local discs = require('disciplines');
    discs:train_discs(e, e.self:GetLevel());
end

function event_say(e)
	if e.self:GetGM() then 
		instance_id = eq.get_zone_instance_id();
		if e.message:find("event help") then
			e.self:Message(18,"Plane of Fire GM controls available:  [" .. eq.say_link("pf_fennin",false,"Fennin Event") .. "]");
		elseif e.message:find("pf_fennin") then
			e.self:Message(18,"[Fennin Event Controls Menu]");
			e.self:Message(18,string.format("Options available:  [%s] [%s] [%s] [%s] [%s]",eq.say_link("pf_fe_despawn",false,"Event Despawn"),
				eq.say_link("pf_fe_reset",false,"Event Full Reset"),eq.say_link("pf_fe_p2",false,"Set Phase 2"),eq.say_link("pf_fe_p3",false,"Set Phase 3"),
				eq.say_link("pf_fe_p4",false,"Set Phase 4")));
		elseif e.message:find("pf_fe_despawn") then
			DepopEvent();
			eq.signal(217066,1);	--signal #fennin_unloader (217066) to unload encounter
			e.self:Message(14,"[Event Despawn complete]");
		elseif e.message:find("pf_fe_reset") then
			DepopEvent();
			
			--reset guardian of doomfire
			eq.depop_all(217050);
			eq.get_entity_list():GetSpawnByID(367088):Repop(2);	--Guardian_of_Doomfire (217050)
			e.self:Message(14,"[Event Reset complete]");
		elseif e.message:find("pf_fe_p2") then
			eq.set_global(instance_id .. "_PoFire_FenninEvent","Phase2",3,"D3");
			ZoneReset();
			e.self:Message(14,"[Phase 2 Loaded]");
		elseif e.message:find("pf_fe_p3") then
			eq.set_global(instance_id .. "_PoFire_FenninEvent","Phase3",3,"D3");
			ZoneReset();
			e.self:Message(14,"[Phase 3 Loaded]");
		elseif e.message:find("pf_fe_p4") then
			eq.set_global(instance_id .. "_PoFire_FenninEvent","Phase4",3,"D3");
			ZoneReset();
			e.self:Message(14,"[Phase 4 Loaded]");
		end
	end
end

function ZoneReset()	--depops zone and reloads controllers
	DepopEvent();
	eq.get_entity_list():GetSpawnByID(367279):Repop(2);	--#fennin_unloader (217066)
end

function DepopEvent()	
	local mob_list = {217418,217419,217420,217421,217422,217424,217426,217439,217440,217450,217428,217429,217449,217453,217436};	
	for _,mob in pairs(mob_list) do
		eq.depop_all(mob);
	end
	eq.get_entity_list():GetMobByNpcTypeID(217050):Depop(true);	--Guardian_of_Doomfire (217050)
	
	eq.spawn_condition("pofire",eq.get_zone_instance_id(),1,0);	--depop/disable elite guardians of ro
end