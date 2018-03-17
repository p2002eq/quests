---- Quest:Mining Operation
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("What ya doing here " .. e.other:GetName() .. "? From da looks of ya ye dont appear to be a miner. A lil dainty if ya ask me! Har");
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