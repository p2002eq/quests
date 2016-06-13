function event_click_door(e)
	local door_id = e.door:GetDoorID();
	if (door_id == 12) then
		if(e.self:HasItem(20883) and not e.self:HasZoneFlag(89)) then
			e.self:SetZoneFlag(89);
			eq.debug("Awarded zone flag.", 1);
		end
	end
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_enter_zone(e)
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end