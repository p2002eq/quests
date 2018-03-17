---- Quest:Mining Operation
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Allo dere " .. e.other:GetName() .. ". A mining I am indeed Aye. Daesorak is a gud and fair boss to us. he keeps us on schedule well. Well enough about me I hope ya find what ya seek in these caves.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("Hurray!");
    end
end