--player.lua for
--Solusek Ro's Tower 
function event_enter_zone(e)
    local instance_id = eq.get_zone_instance_id();
    local instance_version = eq.get_zone_instance_version();
    local discs = require('disciplines');
    discs:update_discs(e, e.self:GetLevel());

    --e.self:Message(1,string.format("[DEBUG], InstanceID = %i, Instance Version = %i",instance_id,instance_version));

    if(instance_id ~= 0) then
        e.self:Message(15,"You have entered a Instanced Version of the zone.");
    end
end

function event_level_up(e)
    local discs = require('disciplines');
    discs:train_discs(e, e.self:GetLevel());
end

function event_click_door(e)
	local door = e.door:GetDoorID();
	local qglobals = eq.get_qglobals(e.self);
	local instance_id = eq.get_zone_instance_id();
	--e.self:Message(14,"Door ID is: " .. door);   --debug to easily check door IDs
	
	--Solro Tower Wing Boss exit portal emotes
	if door == 6 or door == 7 or door == 10 or door == 11 or door == 12 then	--portal click text at end of each wing
		e.self:Message(7,"You pass through the portal of flames and find yourself somewhere new.");
	end
		
	--Door to Arlyxir script to have ash gargoyles perched above to aggro on door click
	if door == 17 and not e.self:GetGM() then	
		local mob_list = eq.get_entity_list():GetMobList();
		
		if mob_list ~= nil then
			for mob in mob_list.entries do
				if mob:GetNPCTypeID() == 212028 then	--an_ash_gargoyle (212028)
					mob:AddToHateList(e.self,1);
				end
			end
		end
	end
	
	--SOLUSEK RO'S CHAMBER PORT IN
	if door == 44 or door == 45 or door == 47 or door == 48 then
		if e.self:GetGM() or (qglobals.pop_poi_behometh_preflag ~= nil and qglobals.pop_poi_behometh_flag ~= nil and qglobals.pop_tactics_tallon ~= nil and qglobals.pop_tactics_vallon ~= nil and qglobals.pop_tactics_ralloz ~= nil and qglobals.pop_sol_ro_arlyxir ~= nil and qglobals.pop_sol_ro_jiva ~= nil and qglobals.pop_sol_ro_rizlona ~= nil and  qglobals.pop_sol_ro_dresolik ~= nil and qglobals.pop_sol_ro_xuzl ~= nil and qglobals.pop_pot_saryrn_final ~= nil and qglobals.pop_pot_saryrn ~= nil and qglobals.pop_hohb_marr ~= nil) then
			e.self:MovePCInstance(212,instance_id,0,-715,244,254);
		else
			e.self:Message(13, "You lack the will to pass through the portal safely.");
		end
	end
	
	--Plane of Fire Portal LUA (In Solusek Ro's Chamber)
	
	if door == 38 or door == 39 then
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(212025) and not e.self:GetGM() then 	--Check if Solusek_Ro is up or also allows GMs to open
			e.self:Message(13, "A strong magical force keeps the floor in place.");
			e.door:ForceClose(e.self);
		end
	end	
end

--zoning to PoFire out of Solusek Ro's Chamber
function event_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local tier4 = 46;

	if e.zone_id == 217 then
		if e.self:GetLevel() >= tier4 and (qglobals.pop_poi_behometh_preflag ~= nil and qglobals.pop_poi_behometh_flag ~= nil and qglobals.pop_tactics_tallon ~= nil and qglobals.pop_tactics_vallon ~= nil and qglobals.pop_tactics_ralloz ~= nil and qglobals.pop_sol_ro_arlyxir ~= nil and qglobals.pop_sol_ro_jiva ~= nil and qglobals.pop_sol_ro_rizlona ~= nil and  qglobals.pop_sol_ro_dresolik ~= nil and qglobals.pop_sol_ro_xuzl ~= nil and qglobals.pop_sol_ro_solusk ~= nil and qglobals.pop_pot_saryrn_final ~= nil and qglobals.pop_pot_saryrn ~= nil and qglobals.pop_hohb_marr ~= nil) then
			if not e.self:HasZoneFlag(217) then
				e.self:SetZoneFlag(217);
			end
		end
	end
end

-----------------------------------
--POP ALPHA TESTING MODULE
function event_say(e)
	local pop_flags = require("pop_flags");
	pop_flags.options(e)
end

-----------------------------------

