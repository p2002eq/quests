-- player.lua for Hollowshade Moor

function event_enter_zone(e)
    local discs = require('disciplines');
    discs:update_discs(e, e.self:GetLevel());
    eq.signal(166257, 999) -- let controller know that player entered zone in case war is in idle mode
end

function event_level_up(e)
    local discs = require('disciplines');
    discs:train_discs(e, e.self:GetLevel());
end