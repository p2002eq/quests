function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
    e.self:Emote("corpse falls dead, as the symbols on its skin lose their glow.");
end