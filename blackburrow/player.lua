local instance_id = nil;

function event_say(e)
	if (e.self:GetGM()) then
		if (e.message:findi("start event")) then
			eq.load_encounter("bbevent");
		elseif (e.message:findi("end event")) then
			eq.unload_encounter("bbevent");
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