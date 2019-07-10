-- flavor text

-- say block
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("How do you do! If you have anything of value, I would advise leaving it with me before you venture further upon the island. There are many unsavory characters who would happily part you with your items, or even your life.");
    end
end

-- return items
function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
