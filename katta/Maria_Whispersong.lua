function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Welcome to Starlight Music. If it's a musical instrument you seek you may be interested in my higher quality instruments that are hand crafted right here in Katta Castellum by the most skilled of craftsman.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end