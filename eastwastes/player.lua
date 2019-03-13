function event_level_up(e)
    local discs = require('disciplines');
    discs:train_discs(e, e.self:GetLevel());
end

function event_enter_zone(e)
	eq.unique_spawn(214104, 0, 0, 479, -4074, 145, 0); -- anniversary quest
    local discs = require('disciplines');
    discs:update_discs(e, e.self:GetLevel());
end