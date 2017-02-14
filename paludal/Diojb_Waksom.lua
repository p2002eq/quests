---- Quest:Mining Operation
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Greetins " .. e.other:GetName() .. ". Great day for a mining if I dunt say so meself. Deres alot to be done so if ye need to speak with someone concerning our operation please see Daesorak.");
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