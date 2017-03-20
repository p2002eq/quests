function event_enter_zone(e)
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_say(e)
	if(e.message:findi("start")) then
		eq.load_encounter("test");
		eq.zone_emote(1, "ENCOUNTER LOAD TRIGGER");
	elseif(e.message:findi("stop")) then
		eq.unload_encounter("test");
		eq.zone_emote(1, "ENCOUNTER UNLOADED");
	end
end