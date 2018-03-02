function event_target_change(e)
	if(e.self:GetTarget():GetCleanName() == "Lord Nagafen" and e.self:GetLevel() > 52 and e.self:Admin() < 80) then
		eq.zone_emote(0,"I will not fight you, but I will banish you!");
		e.self:MovePC(27,-64,262,-93.96,0.0);
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
