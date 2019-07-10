-- flavor text

-- say block
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Yuz should go back where yuz came from. Muxzog would but have important tasks to do to help.");
    elseif(e.message:findi("tasks")) then
        e.self:Say("Muxzog help good miner go home. Sometimes they forgets what they want to do and we helps them. It makes Muxzog feel gud to help.");
    end
end

-- return items
function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
