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
	local qglobals = eq.get_qglobals(e.self, e.other);
	local instance_id = eq.get_instance_id();
	if door == 44 or door == 45 or door == 47 or door == 48 then
		if(tonumber(qglobals.pop_sol_ro_jiva) == 1 and tonumber(qglobals.pop_sol_ro_dresolik) == 1 and tonumber(qglobals.pop_sol_ro_arlyxir) == 1 and tonumber(qglobals.pop_sol_ro_rizlona) == 1 and tonumber(qglobals.pop_sol_ro_xuzl) == 1 and tonumber(qglobals.pop_tactics_ralloz) == 1) then
		  e.other:MovePCInstance(212,instance_id,0,-847,244);
		else
			e.other:Message(13, "You lack the will to use this object!");
		end
	end
end
