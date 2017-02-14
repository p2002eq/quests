function event_spawn(e)
    eq.set_timer("arcorpse", 120000);
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
    if (e.timer == "arcorpse") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end

function event_death_complete(e)
    e.self:Say("Destroy my master and end my suffering");
end

function event_combat(e)
    if(e.joined == true) then
        e.self:Emote("grins through missing lips and attack!");
    end
end