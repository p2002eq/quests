---- Quest:Mining Operation
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello " .. e.other:GetName() .. ". I know what youre thinking. What is a halfling doing amongst all these Dwarven miners. Well a strong halfling I am indeed so i fit in just fine!");
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