function event_enter_zone(e)
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
	eq.unique_spawn(214104, 0, 0, -955, -387, 101, 0);
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end