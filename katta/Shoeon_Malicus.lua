------ Quest:Grave Robbers
function event_spawn(e)
    eq.set_timer("Shoeon", 300);
end

function event_timer(e)
    if (e.timer == "Shoeon") then
        eq.stop_timer(e.timer)
        eq.depop();
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10684})) then -- Shoeon Malicus' Belongings
        e.self:Emote("reaches forward as his hands materialize to grasp the box of belongings then places them carefully in his crypt. He then reaches towards " .. e.other:GetName() .. " again as an etherial warhammer materializes in his hands and is offered to " .. e.other:GetName() .. ".");
        e.other:Faction(168,10); -- Katta Castellum Citizens
        e.other:Faction(307,10); -- Spirits of Katta Castellum
        e.other:Faction(228,-10); -- Nathyn Illuminious
        e.other:QuestReward(e.self,0,0,0,0,10686,10000); -- Warhammer of Ethereal Energy
        eq.depop();
    end
    item_lib.return_items(e.self, e.other, e.trade)
end