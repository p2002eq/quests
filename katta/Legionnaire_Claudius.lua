---- Quest:Traitor to the Validus Custodus
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("ZZZzzzzzzzzzzz");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29845})) then -- Field Orders
        e.self:Say("Huh? What? Oh, umm, let's see here... OK I best get these taken care of right away. Thank you.");
        e.other:Faction(168,5); -- Katta Castellum Citizens
        e.other:Faction(350,5); -- Validus Custodus
        e.other:Faction(206,5); -- Magus Conlegium
        e.other:Faction(228,-5); -- Nathyn Illuminious
        e.other:Faction(55,-5); -- Coterie of the Eternal Night
        e.other:Faction(139,-5); -- Hand of Seru
        e.other:Faction(284,-5); -- Seru
        e.other:Faction(96,-5); -- Eye of Seru
        e.other:Faction(138,-5); -- Hand Legionnaries
        e.other:QuestReward(e.self,0,0,0,0,item,exp); --
    end
    item_lib.return_items(e.self, e.other, e.trade)
end