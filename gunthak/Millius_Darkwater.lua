--TODO

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("looks somewhat startled as you approach him. 'Oh hello, "..e.other:GetName()..". The tides of Prexus shift angrily these days.  Be careful as you explore the island, this is a most accursed place.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end