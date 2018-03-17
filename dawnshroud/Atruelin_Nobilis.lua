function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello " .. e.other:GetName() .. ". What brings you here to [" .. eq.say_link("Dawnshroud") .. "]?");
    elseif(e.message:findi("Dawnshroud")) then
        e.self:Say("Dawnshroud is a crazy place. I suggest you travel with a good group here. it can get dangerous.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end