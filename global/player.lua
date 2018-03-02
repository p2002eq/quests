function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_enter_zone(e)
	if(e.self:GetRace() == 330) then
		e.self:MovePC(185,-436.45,604,-87.1,124.0);
	end
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end
