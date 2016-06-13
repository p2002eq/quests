function event_death_complete(e)
    --eq.signal(102138, 1) -- edit this line to signal Vulak Ring NPC upon player death
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_enter_zone(e)
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end