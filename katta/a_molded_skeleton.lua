function event_spawn(e)
    eq.set_timer("mskeleton", 120000);
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
    if (e.timer == "mskeleton") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end

function event_death_complete(e)
    e.self:Emote("claws at the ground for a few moments and then falls still.");
end

function event_combat(e)
    if(e.joined == true) then
        e.self:Emote("yearns to taste your living flesh!");
    end
end