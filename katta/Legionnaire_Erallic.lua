---- Quest:The Eye of Trust
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello " .. e.other:GetName() .. ".");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3881})) then -- A Vial of Thick Liquid
        e.self:Emote("gasps silently for air and the falls completely still! No one seems to have heard you.");
        e.other:Faction(350,2); -- Validus Custodus
        e.other:Faction(168,2); -- Katta Castellum Citizens
        e.other:Faction(206,2); -- Magus Conlegium
        e.other:Faction(228,-2); -- Nathyn Illuminious
        e.other:Faction(55,-2); -- Coterie of the Eternal Night
        e.other:Faction(284,-2); -- Seru
        e.other:Faction(139,-2); -- Hand of Seru
        e.other:Faction(96,-2); -- Eye of Seru
        e.other:Faction(138,-2); -- Hand Legionnaires
        e.other:QuestReward(e.self,0,0,0,0,3883,1000); -- An Empty Poison Vial
    end
    item_lib.return_items(e.self, e.other, e.trade)
end