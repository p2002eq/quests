
function event_click_door(e)
	local door = e.door:GetDoorID();
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);
	--eq.zone_emote(14,"Door ID is: " .. door);   --debug to easily check door IDs
	
	
	
	local tier3 = 62;
	if e.door_id == 4 then
		if e.self:GetLevel() >= tier3 and qglobals.pop_poj_mavuin ~= nil and qglobals.pop_poj_tribunal ~= nil and qglobals.pop_poj_valor_storms ~= nil and qglobals.pop_pos_askr_the_lost ~= nil and tonumber(qglobals.pop_pos_askr_the_lost) == 3 and  qglobals.pop_pos_askr_the_lost_final ~= nil then
			if not e.self:HasZoneFlag(209) then
				e.self:SetZoneFlag(209);
			end
		else
			e.self:Message(13,"You lack the will to pass through this portal safely.");
		end
	end
end